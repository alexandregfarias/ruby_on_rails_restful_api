class Contact < ApplicationRecord
    # Associações
    belongs_to :kind, optional: true # Como tem apenas um tipo, :kind fica no singular.
    has_many :phones # Como tem vários telefones, :phones fica no plural.
    has_one :adress
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :adress, update_only: true

    def birthdate_br
        I18n.l(self.birthdate) unless self.birthdate.blank?
    end

    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
        }
    end

    # def author
    #     "Alexandre Farias"
    # end

    # def kind_description
    #     self.kind.description
    # end

    def as_json(options={})
       hash = super(options)
       hash[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
       hash
    end

    # def hello
    #     I18n.translate('hello')
    # end

    # def i18n
    #     I18n.default_locale = :pt
    # end
end
