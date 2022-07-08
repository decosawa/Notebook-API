class PhonesController < ApplicationController
    
    before_action :set_phone, only: [:show, :update, :create]

    def show
    
        render json: @contact.phones
    
    end

    def create

        @contact.phones << Phone.new(phone_params)

        if (@contact.save)
            
            render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
        else

            render json: @contact.phones.errors, status: :unprocessable_entity

        end

    end

    def update
        
        phone = Phone.find(phone_params[:id])
        

        if(phone.update(phone_params))

            render json: @contact.phones

        else

            render json: @contact.errors, status: :unprocessable_entity

        end

    end 

    def destroy
    
        @contact.phones.destroy 

    end

    private

        def set_phone

            @phone = Contact.find(params[:contact_id]).phone
        
        end

        def phone_params

            ActiveModelSerializers::Deserialization.jsonapi_parse(params)

        end

end