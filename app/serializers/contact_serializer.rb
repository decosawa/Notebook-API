class ContactSerializer < ActiveModel::Serializer

  belongs_to :kind do

    link(:related) {

      kind_url(object.kind.id)
  
    }

  end

  has_many :phones
  has_one :address

  def author
  
    "Deco"
  
  end

end
