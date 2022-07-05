namespace :dev do
  desc "Setts up the development environment"
  task setup: :environment do

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




  end

  

end
