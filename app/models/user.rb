class User < ActiveRecord::Base
  validates :username, :presence => true  
  validates :username, :uniqueness => true
  validates :password, :length => { :minimum => 5}
  before_create :hash_password
  has_many :posts
  has_many :comments
  include BCrypt

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return nil unless user
    db_password = Password.new(user.password)
    db_password == password ? user : nil  
  end

  private
  def hash_password
    self.password = Password.create(self.password)
  end  
end
