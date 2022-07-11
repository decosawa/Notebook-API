class Contact < ApplicationRecord

    validates_presence_of :kind
    validates_presence_of :address

    belongs_to :kind
    has_many :phones
    has_one :address
    accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: :all_blank
    accepts_nested_attributes_for :address, update_only: true
    paginates_per 5

    def author
    
        "Deco"
    
    end

    def kind_description

        self.kind.description

    end

    def phone
        
        self.phones

    end

    def as_json(options={})
    
        super(methods: [:author, :kind_description, :phone, :address], root: true, status: :partial_content, except: :kind_id)

    end

end
