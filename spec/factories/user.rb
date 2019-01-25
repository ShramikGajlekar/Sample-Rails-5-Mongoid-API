FactoryBot.define do 
	factory :random_user, class: User do
		email {Faker::Internet.unique.email}
		password {Faker::Number.number(10)}
		first_name {Faker::Name.first_name }
		last_name {Faker::Name.last_name}
		bio {Faker::Lorem.paragraph}
	end
end