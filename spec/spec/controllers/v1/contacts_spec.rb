require 'rails_helper'

class Hash

    def json(parts)
    
        ary = parts.split(">")
        ary.reduce(self) do |memo, key|

            memo.fetch(key.to_s.strip) if memo

        end

    end

end

describe V1::ContactsController, type: :controller do

    it 'request index and return 200 OK' do
        
        request.accept = 'application/vnd.api+json'
        get :index
        expect(response.status).to have_http_status(:ok)

    end

    it 'request index and return 406 NOT ACCEPTABLE' do
        
        get :index
        expect(response.status).to have_http_status(:not_acceptable)

    end

    it 'GET /contacts/:id' do

        contact = Contact.first

        request.accept = 'application/vnd.api+json'
        get :show, params: { id: contact.id}

        rb = JSON.parse(response.body)

        expect(rb.json('data > id')).to eq(contact.id.to_s)
        expect(rb.json('data > type')).to eq('contacts')
        expect(rb.json('data > attributes > name')).to eq(contact.name)
        
    end

end