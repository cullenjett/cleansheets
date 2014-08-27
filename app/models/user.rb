class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  embeds_many :authentications

  has_secure_password validations: false

  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email
end
