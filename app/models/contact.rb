class Contact < ApplicationRecord

    belongs_to :kind
    has_many :phones

    def author
    
        "Deco"
    
    end

    def kind_description

        self.kind.description

    end

    def as_json(options={})
    
        super(methods: [:author, :kind_description], root: true, status: :partial_content, except: :kind_id)

    end

end
