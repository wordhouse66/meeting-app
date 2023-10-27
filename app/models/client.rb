class Client < ApplicationRecord
  has_many :meetings
	belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "first_name", "id", "id_value", "last_name", "phone_number", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["meetings", "user"]
  end
end
