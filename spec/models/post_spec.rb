require 'rails_helper'

RSpec.describe Post do
  describe 'validations in Post model' do
    let!(:post) {build(:random_post)}
  	
    it 'ensures presence of title' do
      post.title = nil
      expect(post).to_not be_valid
    end
    
    it 'ensures presence of description' do
      post.desc = nil
      expect(post).to_not be_valid
    end

  	it 'ensures if all the fields are correct then post is valid' do
  		expect(post).to be_valid
  	end

  end
end
