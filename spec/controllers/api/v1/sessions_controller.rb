require 'rails_helper'
RSpec.describe  "Api::V1::SessionsController", type: :request  do
	describe 'Sessions API' do
		password = 123456789
		let!(:user) {create :random_user, password: password}
		
		it 'ensures user can sign in successfully' do
			post "/api/sessions?email=#{user.email}&password=#{password}"
			expect(response.status).to eq(201)
			json_object = JSON.parse(response.body)
			expect(json_object['authentication_token']).to_not eq(nil)
		end

		it 'ensures user can sign out successfully' do
			user.save
			delete '/api/destroy_session', headers: {'X-User-Token': user.authentication_token }
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['message']).to eq('succesfully signed out')
		end

	end
end