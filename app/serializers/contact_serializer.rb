class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

    belongs_to :kind do
      link(:related) { kind_url(object.kind.id) }
    end

    has_many :phones
    has_one :adress

    # link(:self) { contact_url(object.id) }
    # link(:kind) { kind_url(object.kind.id) }

    meta do
      {author: "Alexandre Gomes de Farias"}      
    end

  def attributes(*args)
    hash = super(*args)
    # hash[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
 end

end
