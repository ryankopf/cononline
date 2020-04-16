class PaypalController < ApplicationController
  def ipn
    unless request.post?
      head(:bad_request)
      return
    end
    begin
      response = validate_IPN_notification(request.raw_post)
      if response.chomp == 'VERIFIED'
        if params[:payment_status] == 'Completed' # check the payment status, could also be pending or denied.
          if (params[:txn_type].nil?)
            #do something based on params[:reason_code]
          else
            Rails.logger.info response.chomp + " " + params[:txn_type]
            if (params[:txn_type] == "web_accept")
              cart_id = params[:item_number]
              cart(cart_id)
            end #end if web_accept
          end #end txn_type or reason_code
        end #END IF PAYMENT COMPLETED
        render plain: "COMPLETE"
      else
        # LATER: Send admin an email or log this.
        head(:bad_request)
      end #END IF VERIFIED
    rescue Net::HTTPError
      head(:bad_request)
    end
  end #END PAYPAL IPN THING
  private
  def cart(id)
    cart = Cart.find(id)
    order = cart.paid!(params)
    request.session[:orders] ||= []
    request.session[:orders].push(order.id)
  end
  def validate_IPN_notification(raw)
    return "VERIFIED" if Rails.env == "test"
    uri = URI.parse('https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 60
    http.read_timeout = 60
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.use_ssl = true
    response = http.post(uri.request_uri, raw,
                         'Content-Length' => "#{raw.size}",
                         'User-Agent' => "IPN Checker"
    ).body
  end
end