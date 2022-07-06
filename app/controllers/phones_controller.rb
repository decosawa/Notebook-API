class PhonesController < ApplicationController
    before_action :set_phone, only: [:show]

    def show
    
        render json: @phone
    
    end

    private

        def set_phone

            @phone = Contact.find(params[:contact_id]).phone
        
        end
        
end