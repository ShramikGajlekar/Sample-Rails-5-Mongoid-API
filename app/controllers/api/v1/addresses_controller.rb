module Api
	module V1
		class AddressesController < Api::BaseController
			before_action :set_address, except: [:index,:create]
			def index
				@addresses = signed_user.addresses
				render json: {data: @addresses,status: 200}
			end
			def show
				if @address
					render json: {data: @address, status: 200}
				else
					render json: {message: 'Address Not Found', status: 404}
				end
			end
			def create
				@address = signed_user.addresses.new(address_params)
				if @address.save
					render json: {data: @address, status: 201}
				else
					render json: {error: 'Unable to Create Address', status: 500}
				end
			end
			def update
				if @address.update(address_params)
					render json: {data: @address, status: 201}
				else
					render json: {error: 'Unable to Update Address', status: 500}
				end
			end
			def destroy
				if @address.destroy
					render json: {message: 'Address Deleted Successfully', status: 200}
				else
					render json: {error: 'Unable to Update Address', desc: @address.errors},status: :unprocessable_entity
				end
			end

			private
				def address_params
					params.permit(:user_id, :flat_no, :addrline, :city, :state, :country, :pin)	
				end
				def set_address
					@address = signed_user.addresses.find(params[:id])
				end
		end
	end
end