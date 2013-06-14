class User < ActiveRecord::Base 
    has_many :posts
    has_many :ratings
    
    # Include default devise modules. Others available are: 
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and:omniauthable 
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable 
    # Setup accessible (or protected) attributes for your model 
    attr_accessible :email, :password, :password_confirmation, :remember_me
    
    def rated?(user)
        return user.is_a?(User) && (id == user.id || Rating.where('user_id = ? AND blogger_id = ?', self.id, user.id).count > 0 )
    end
end