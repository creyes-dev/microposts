class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :microposts

  validates :name, presence: true, length: 50
  validates :email, presence: true
end
