FactoryBot.define do 
	factory :random_comment, class: Comment do
		association :user, factory: :random_user
		association :post, factory: :random_post
		body {Faker::Lorem.sentence(1)}
	end
end