namespace :dev do
  desc "Setts up the development environment"
  task setup: :environment do

    %x(rails db:drop db:create db:migrate)

    puts "Registering contact type"

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|

      Kind.create!(

        description: kind

      )

    end

    puts "Contact type registered with success"

    #############################################################################################

    puts "Registering contacts"

    100.times do |i|

      Contact.create!(

        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 60.years.ago, to: 18.years.ago),
        kind:Kind.all.sample

      )

    end

    puts "Contacts registered with success"

    puts "Registering phones"

    Contact.all.each do |contact|
      
      Random.rand(5).times do |i|
      
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact:contact)
        contact.phones << phone
        contact.save!

      end

    end

    puts "Phones registered"

    puts "Registering addresses"

    Contact.all.each do |contact|
      
      address = Address.create!(street: Faker::Address.street_name, city: Faker::Address.city, contact:contact)

    end

    puts "Addresses registered"

  end

end
