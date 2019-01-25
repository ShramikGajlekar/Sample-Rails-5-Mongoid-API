require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations in address Model' do
    let!(:user) {FactoryBot.create(:random_user)}

    it 'ensures address can be created if embedded in user' do
      address = user.addresses.build(flat_no: Faker::Address.building_number, addrline: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, country: 'India', pin: Faker::Number.number(6))
      expect(address).to be_valid
    end

    it 'ensures presence of pin' do
      address = user.addresses.build(flat_no: Faker::Address.building_number, addrline: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, country: 'India', pin: Faker::Number.number(6))
      address.pin = nil
      expect(address).to_not be_valid
    end
     
    it 'ensure country present is the one that is actually allowed' do
      address = user.addresses.build(flat_no: Faker::Address.building_number, addrline: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, pin: Faker::Number.number(6))
      unless ['India', 'US', 'UK', 'Nepal', 'Bhutan', 'Bangladesh'].include? address.country
        expect(address).to_not be_valid
      else
        expect(address).to be_valid
      end
    end

    it 'ensures if all the fields are correct then address is valid' do
      address = user.addresses.build(flat_no: Faker::Address.building_number, addrline: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state, country: 'India', pin: Faker::Number.number(6))
      expect(address).to be_valid
    end
  end
end