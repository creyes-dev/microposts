class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :microposts

  before_save { |user| user.email = email.downcase } # justo antes de guardar usar solo minúsculas en el mail

  validates :name, presence: true, length: 50
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
