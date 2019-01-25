require 'rails_helper'

RSpec.describe Comment do
  describe 'validations in Comment model' do
    let!(:post) {build(:random_post)}

    it 'ensures presence of body' do
      comment = post.comments.build
      comment.body = nil
      expect(comment).to_not be_valid
  	end

    it 'ensures if all the fields are correct then comment is valid' do
      comment = post.comments.build(body: "body")
      expect(comment).to be_valid
    end
  end
end
