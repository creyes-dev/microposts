class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts

  before_save { self.email.downcase! } # justo antes de guardar usar solo minúsculas en el mail
  before_save :create_remember_token   # Callback create_remember_tolken es disparado antes de que se registre el usuario

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  def create_remember_token
    # Si no usamos self la asignación creará una variable local llamada remember_token
    # pero necesitamos asignar un valor al campo remember_token del registro de User
    # en la base de datos
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
