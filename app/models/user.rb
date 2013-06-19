class User < ActiveRecord::Base 
    has_many :posts
    has_many :ratings, :foreign_key => 'blogger_id'
    has_many :votings, :class_name => "BlogVoting", :foreign_key => "blog_id"
    has_many :visits, :class_name => "BlogVisit"
    # Include default devise modules. Others available are: 
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and:omniauthable 
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable 
    # Setup accessible (or protected) attributes for your model 
    attr_accessible :email, :password, :password_confirmation, :remember_me
    
    def rated?(user)
        return user.is_a?(User) && (id == user.id || Rating.where('user_id = ? AND blogger_id = ?', self.id, user.id).count > 0 )
    end
    def visited?(visit)
        return visit.is_a?(Visit) && self.visits.where(:visit_id => visit.id).count > 0
    end
    def visit(visit)
        if !visited?(visit)
            self.visits.create(:visit_id => visit.id)
        end
    end
    def rate
        average = Rating.where(:blogger_id => self.id).average(:score).to_f
        return average > 0? average.to_s : "N/A"
    end
end