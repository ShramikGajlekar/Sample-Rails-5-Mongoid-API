require 'rails_helper'

RSpec.describe User do
	describe 'validations in user Model',type: :model do
		let!(:user) {build(:random_user)}
		it 'ensures presence of first name' do
			user.first_name = nil
			expect(user).to_not be_valid
		end

		it 'ensures	presence of last name' do
			user.last_name = nil
			expect(user).to_not be_valid
		end
		
		it 'ensure presence of email' do
			user.email = nil
			expect(user).to_not be_valid
		end

		it 'ensures if all the fields are correct then user is valid' do
			expect(user).to be_valid
		end
	end
end