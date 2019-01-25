require 'rails_helper'
RSpec.describe  "Api::V1::AddressesController", type: :request  do
	describe 'Addresses API' do
		before(:each) do
       @user = FactoryBot.create(:random_user)
       @user.save
       20.times do 
        @user.addresses.create(flat_no: Faker::Address.building_number, addrline: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, country: 'India', pin: Faker::Number.number(6))
       end
       @last_address = @user.addresses.last
    end
		
		it 'ensures status returns ok for get /addresses' do
			get '/api/addresses', headers: {'X-User-Token': @user.authentication_token }
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['data'].length).to eq(20)
		end

		it 'ensures json object returned is the one that is requested' do
			get "/api/addresses/#{@last_address.id}", headers: {'X-User-Token': @user.authentication_token }
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['data']['addrline']).to eq(@last_address.addrline)
			expect(json_object['data']['city']).to eq(@last_address.city)
			expect(json_object['data']['_id']['$oid']).to eq(@last_address.id.to_s)
			expect(json_object['data']['country']).to eq(@last_address.country)
			expect(json_object['data']['state']).to eq(@last_address.state)
			expect(json_object['data']['flat_no']).to eq(@last_address.flat_no)
			expect(json_object['data']['pin']).to eq(@last_address.pin)
		end

		it 'ensures address can be deleted successfully' do
			delete "/api/addresses/#{@last_address.id}", headers: {'X-User-Token': @user.authentication_token }
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['message']).to eq('Address Deleted Successfully')
		end

	end
end