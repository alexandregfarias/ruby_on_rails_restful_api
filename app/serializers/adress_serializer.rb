class AdressSerializer < ActiveModel::Serializer
    attributes :id, :street, :city
end