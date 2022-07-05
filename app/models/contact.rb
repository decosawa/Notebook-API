class Contact < ApplicationRecord

    def author
        "Deco"
    end

    def as_json(options={})
        super(methods: :author, root: true, status: :partial_content)
    end

end
