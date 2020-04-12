module HasMoney

  protected
  def string_to_integer(amount)
    negative = amount.include?("-")
    a_string = amount.delete("$").delete("-").delete(",")
    a_string = (a_string[-1] == ".") ? (a_string+"00") : a_string
    a_string = (a_string[-2] == ".") ? (a_string+"0") : a_string
    a_string = (a_string.include?(".") ? a_string.delete(".") : "#{a_string.to_i}00")
    return (negative ? 0 - a_string.to_i : a_string.to_i)
  end
  def test_string_to_integer
    puts "50.00 is #{self.amount_string_to_int('50.00')}"
    puts "51.10 is #{self.amount_string_to_int('51.10')}"
    puts "2.2 is #{self.amount_string_to_int('2.2')}"
    puts "15.0 is #{self.amount_string_to_int('15.0')}"
    puts "15. is #{self.amount_string_to_int('15.')}"
    puts "100.0 is #{self.amount_string_to_int('100.0')}"
  end
  def integer_to_string(amount)
    return 0 if amount.nil? || amount.blank?
    string = ((amount < 0) ? "-" : "")
    amt_s = amount.abs.to_s
    size = amt_s.length
    return "0.00" if size == 0
    return "#{string}0.0#{amt_s}" if size == 1
    return "#{string}0.#{amt_s}" if size == 2
    return "#{string}#{amt_s[0..-3]}.#{amt_s[-2..-1]}" if size > 2
  end

end