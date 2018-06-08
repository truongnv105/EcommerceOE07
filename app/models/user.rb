class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token

  before_save {email.downcase!}
  before_create :create_activation_digest

  has_many :comments
  has_many :orders
  has_many :ratings

  validates :name, presence: true,
    length: {maximum: Settings.users.name.max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.users.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.users.password.min_length}, allow_nil: true
  validates :phone_number, presence: true,
    length: {maximum: Settings.users.phone_number.max_length}
  validates :address, presence: true,
    length: {minimum: Settings.users.address.min_length}

  scope :user_activated, -> {where("activated = ? AND is_admin = ?", true, false)}

  scope :name_like, -> (search){
    if search.present?
      where("name LIKE :q OR email LIKE :q", q: "%#{search}%")
    end
  }

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def activate
    update_attributes activated: true, activated_at: Time.zone.now
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attributes reset_digest: User.digest(reset_token),
      reset_sent_at: Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end

  def password_reset_expired?
    reset_sent_at < 8.hours.ago
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
