class ContactSerializer < ActiveModel::Serializer
  attributes :id,:name,:email,:birthday

  belongs_to :kind do 
    link(:related) { kind_url(object.kind.id)}

  end
  has_many :phones
  has_one :address

  # link(:self) { contact_url(object.id)}
  # link(:kind) { kind_url(object.kind.id)}

  def attributes(*args)
    h = super(*args)
    # PT_BR ------> h[:birthday] = (I18n.l(object.birthday)unless object.birthday.blank?)
    h[:birthday] = object.birthday.to_time.iso8601 unless object.birthday.blank?
    h
end
end
