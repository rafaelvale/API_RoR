class Contact < ApplicationRecord
    #Associations
    belongs_to :kind, optional: true
    has_many :phones


    def as_json(options={})
        h = super(options)
        h[:birthday] = (I18n.l(self.birthday)unless self.birthday.blank?)
        h
    end
    # def birthday_br
    #     I18n.l(self.birthday) unless self.birthday.blank?
    # end


    # def to_br
    #     {
    #         name: self.name, 
    #         email: self.email,
    #         birthday: (I18n.l(self.birthday)unless self.birthday.blank?)
    #     }
    # end

    # def author
    #     "Rafael Vale"        
    # end

    # def kind_description
    #     self.kind.description
    # end

    # def as_json(options={})
    #     super(
    #         root: true, 
    #         methods: [:kind_description, :author], 
    #         include: { kind:{only: :description}}
        
    #     )
    # end
    
end
