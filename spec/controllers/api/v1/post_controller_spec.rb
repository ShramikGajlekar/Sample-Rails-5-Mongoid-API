require 'rails_helper'
RSpec.describe  "Api::V1::PostsController", type: :request  do
  describe 'Posts API' do
    before(:each) do
       @user = FactoryBot.create(:random_user)
       @user.save
       20.times do 
        post = FactoryBot.create(:random_post)
        @user.posts << post
       end
       @last_post = @user.posts.last
    end
    it 'ensures status returns ok for get /posts' do
      get '/api/posts', headers: {'X-User-Token': @user.authentication_token }
      expect(response.status).to eq(200)
      json_object = JSON.parse(response.body)
      expect(json_object['data'].length).to eq(20)
    end

    it 'ensures json object returned is the one that is requested' do
      get "/api/posts/#{@last_post.id}", headers: {'X-User-Token': @user.authentication_token }
      expect(response.status).to eq(200)
      json_object = JSON.parse(response.body)
      expect(json_object['data']['user_id']['$oid']).to eq(@last_post.user_id.to_s)
      expect(json_object['data']['title']).to eq(@last_post.title)
      expect(json_object['data']['desc']).to eq(@last_post.desc)
    end

    it 'ensures post can be deleted successfully' do
      delete "/api/posts/#{@last_post.id}", headers: {'X-User-Token': @user.authentication_token }
      expect(response.status).to eq(200)
      json_object = JSON.parse(response.body)
      expect(json_object['message']).to eq('Post Deleted Successfully')
    end

  end
end