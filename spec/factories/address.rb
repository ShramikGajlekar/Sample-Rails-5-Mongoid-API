FactoryBot.define do 
	factory :random_address, class: Address do
		association :user, factory: :random_user
		flat_no {Faker::Address.building_number}
		addrline {Faker::Address.street_address}
		city {Faker::Address.city}
		state {Faker::Address.state}
		country {Faker::Address.country}
		pin {Faker::Number.number(6)}
	end
	factory :address_for_requests, class: Address do
		association :user, factory: :random_user
		flat_no {Faker::Address.building_number}
		addrline {Faker::Address.street_address}
		city {Faker::Address.city}
		state {Faker::Address.state}
		country 'India'
		pin {Faker::Number.number(6)}
	end
end