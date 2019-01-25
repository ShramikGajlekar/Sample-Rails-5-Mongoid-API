FactoryBot.define do 
	factory :random_post, class: Post do
		association :user, factory: :random_user
		desc {Faker::Lorem.paragraph(1)}
		title {Faker::Lorem.sentence(1)}
	end
end