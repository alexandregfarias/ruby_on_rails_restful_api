class Contact < ApplicationRecord
    belongs_to :kind, optional: true

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

    # def as_json(options={})
    #     super(
    #         root: true,
    #         methods: [:author, :kind_description]
    #     )
    # end

    # def hello
    #     I18n.translate('hello')
    # end

    # def i18n
    #     I18n.default_locale = :pt
    # end
end
