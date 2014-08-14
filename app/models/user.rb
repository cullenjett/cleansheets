class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  embeds_many :authentications

  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email
end
