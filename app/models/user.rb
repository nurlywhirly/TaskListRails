class User < ActiveRecord::Base
  validates :email, :uid, :provider, presence: true
  has_many :tasks

  def self.create_from_github(auth_hash)
    user       = User.new
    user.uid   = auth_hash[:uid].to_i
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']

    return user
  end
end
