class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true

  # added validation true for image
  validates :image, presence: true

  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, class_name: "User"
  
  has_many :events, :through => :friends, :class_name => 'Event', :source => :events
  has_many :events

  def accepted_friends
    Friendship.where(user_id: self.id, status: "accepted").map{|friendship| friendship.friend }
  end

  def requested_friends
    Friendship.where(user_id: self.id, status: "requested").map{|friendship| friendship.friend }
  end

  def pending_friends
    Friendship.where(user_id: self.id, status: "pending").map{|friendship| friendship.friend }
  end

end