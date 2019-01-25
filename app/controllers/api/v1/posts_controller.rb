module Api
	module V1
		class PostsController < Api::BaseController
			before_action :set_post, except: [:index,:create]

			def index
				posts = signed_user.posts
				render json: {data: posts, status: 200}
			end

			def show
				if @post
					render json: {data: @post, status: 200}
				else
					render json: {message: "Post Not Found", status: 404}
				end
			end

			def create
				post = signed_user.posts.new(post_params)
				if post.save
					render json: post,status: :created
				else
					render json: {message: 'unable to create post'}, status: 500
				end
			end

			def update
				if @post.update(post_params)
					render json: {data: @post, status: 201}
				else
					render json: {error: "Unable to Update Post", status: 500}
				end
			end

			def destroy
				if @post.destroy
					render json: {message: "Post Deleted Successfully", status: 200}
				else
					render json: {error: "Unable to Update Post"}
				end
			end

			private

			def post_params
				params.permit(:user_id, :desc, :title)	
			end

			def set_post
				@post = signed_user.posts.find(params[:id])
			end

		end
	end
end