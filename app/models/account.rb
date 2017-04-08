class Account < ApplicationRecord
  has_many :teams
  has_many :players

  validates :account_name, :account_email, :presence => true
  validates :account_email, :uniqueness => true
  validate :password_length

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
    if @new_password.length < 6
      errors.add(:password, "must be greater than 6")
    end
  end

end