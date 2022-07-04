namespace :dev do
  desc "Setts up the development environment"
  task setup: :environment do

    puts "Registering contacts"

    100.times do |i|

      Contact.create!(

        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 60.years.ago, to: 18.years.ago)

      )

    end

    puts "Contacts registered with success" 

  end

end
