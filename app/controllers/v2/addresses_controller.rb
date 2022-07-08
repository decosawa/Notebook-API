module v2

    class AddressesController < ApplicationController
        before_action :set_address, only: [:show, :update, :create]

        def show
        
            render json: @address
        
        end

        def create

            @contact.address = Address.new(address_params)

            if (@contact.save)
                
                render json: @contact.address, status: :created, location: contact_address_url(@contact)
            else

                render json: @contact.address.errors, status: :unprocessable_entity

            end

        end

        def update

            if(@contact.address.update(address_params))

                render json: @contact.address

            else

                render json: @contact.errors, status: :unprocessable_entity

            end

        end 

        def destroy
        
            @contact.address.destroy 

        end

        private

            def set_address

                @address = Contact.find(params[:contact_id]).address
            
            end

            def address_params

                ActiveModelSerializers::Deserialization.jsonapi_parse(params)

            end
            
    end

end