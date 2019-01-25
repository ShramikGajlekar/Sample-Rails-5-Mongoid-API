module Api
	module V1
		class CommentsController < Api::BaseController
			before_action :set_post
			def create
				comment = @post.comments.new(comment_params)
				if comment.save
					render json: comment,status: :created
				else
					render json: {message: 'unable to create comment'}, status: 500
				end
			end

			def destroy
				comment = @post.comment.find(params[:id])
				if comment.destroy
					render json: {message: 'Comment Succesfully deleted'},status: 200
				else
					render json: {message: 'Unable to delete comment'}, status: 500
				end
			end

			private
				def set_post
					@post = Post.find(params[:post_id])
				end
				def comment_params
					params.permit(:user_id,:post_id,:body)
				end
		end
	end
end