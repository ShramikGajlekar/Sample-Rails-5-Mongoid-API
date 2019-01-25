require 'rails_helper'
RSpec.describe  "Api::V1::CommentsController", type: :request  do
	describe 'Comments API' do
		 before(:each) do
       @user = FactoryBot.create(:random_user)
       @user.save
       post = FactoryBot.create(:random_post)
       @user.posts << post
       @last_post = @user.posts.last
       20.times do 
        @last_post.comments.create(body: "body")
       end
       @last_comment = @last_post.comments.last
    end
		
		it 'ensures post can be deleted successfully' do
			delete "/api/comments/#{@last_comment.id}"
			expect(response.status).to eq(200)
			json_object = JSON.parse(response.body)
			expect(json_object['message']).to eq('Comment Succesfully deleted')
		end

	end
end