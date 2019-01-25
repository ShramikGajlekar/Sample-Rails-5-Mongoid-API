module Api
	class BaseController < ActionController::API
		def signed_user
			User.where(authentication_token: request.headers['X-User-Token']).first
		end
	end
end