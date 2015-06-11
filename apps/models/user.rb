class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  # パスワードチェック
  has_secure_password

  validates :email,
    presence: true,
    length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  validates :name,
    presence: true,
    length: {maximum: 100}

  before_save do
    #user名、emailは全て小文字扱いとする
    self.name  = name.downcase
    self.email = email.downcase
    User.where('email = ? OR name = ?', self.email, self.name).first
    binding.pry_remote
    
  end
end
