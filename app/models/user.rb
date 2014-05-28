class User < ActiveRecord::Base

  has_many :memberships
  has_many :games, through: :memberships

  before_create :create_remember_token
  before_save :normalize_fields

  validates :name,
    presence: true,
    length: { maximum: 60 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }


  validates :password,
    length: { minimum: 8 }

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token
  end

  def normalize_fields
    self.email.downcase!
  end

end
