module Api
	module V1
		class SessionsController < Api::BaseController
			def create
				user = User.where(email: params[:email]).first
				if user&.valid_password?(params[:password])
					user.save
					render json: user.as_json(only: [:authentication_token]),status: :created
				else
					head(:unauthorized)
				end
			end
			def destroy_session 
				user = signed_user
				if user
					user.update(authentication_token: nil)
					render json: {message: 'succesfully signed out'},status: 200
				else
					head(:unauthorized)
				end
			end
		end
	end
end