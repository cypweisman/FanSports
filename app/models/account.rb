class Account < ApplicationRecord
  has_many :teams
  has_many :players

  validates :account_name, :account_email, :presence => true
  validates :account_email, :uniqueness => true
  validate :password_length

  # Authentication constants
  MIN_LENGTH = 6
  MAX_LENGTH = 50

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @new_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(given_password)
    self.password == given_password
  end

  def password_length
    if @new_password.length < MIN_LENGTH || @new_password.length > MAX_LENGTH
      errors.add(:password, "must be between #{MIN_LENGTH} and #{MAX_LENGTH} letters long")
    end
  end

end