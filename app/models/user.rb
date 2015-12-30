class User < ActiveRecord::Base
  has_many :favorites, inverse_of: :user
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, :confirmation => true

  def self.authenticate(email, password)
    user = User.find_by({email: email})
    if user && user.match_password(password)
      return user
    else
      return false
    end
  end

  def match_password(password)
    password == self.password
  end

end
