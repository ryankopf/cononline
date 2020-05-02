Rails.logger.info Rails.env
case Rails.env
when "test"
  #User.create(email: 'kopf1988+admin@gmail.com')
  u2 = User.create(email: 'kopf1988@gmail.com', dont_email: true)
  v1 = Vendor.create(name: 'Dragon Vending Company', category: 'dealer', email: 'dragon@company.com',
                about: 'Dragon vending company sells literal dragons! Not just small parts of dragons, but entire, living, breathing, dragons. Not available in California.',
                user_id: u2.id, approved: true)
  v1.image.attach(io: Rails.root.join("app/assets/images/dragon-company.png").open, filename: 'dragon-company.png')
  Vendor.create(name: 'Fake spam company not approved.', category: 'dealer', email: 'knockoffs@fakecompany.com',
                about: 'This company does not really exist.',
                user_id: u2.id, approved: false, image: Rails.root.join("app/assets/images/dragon-company.png").open)
end