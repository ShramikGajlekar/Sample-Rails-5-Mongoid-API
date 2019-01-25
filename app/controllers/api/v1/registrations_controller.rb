module Api
	module V1
		class RegistrationsController < Api::BaseController
			def create
				user = User.create(user_params)
				if user
					user.save
					render json: {data: user.as_json(only: [:authentication_token]), message: "successfully registered"},status: :created
				else
					head(:unauthorized)
				end
			end
			private
			def user_params
				params.permit(:email,:password,:first_name, :last_name)
			end
		end
	end
end