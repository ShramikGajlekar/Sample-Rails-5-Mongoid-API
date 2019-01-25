module Api
	module V1
		class UsersController < Api::BaseController
			def show_user_data
				user = signed_user
				if user
					render json: {user_data: user.as_json(only: [:first_name,:last_name,:bio]), addresses: user.addresses, posts: user.posts}
				else
					head(:unauthorized)
				end
			end
			private
				def user_params
					params.require(:user).permit(:first_name,:last_name,:bio)
				end
		end
	end
end