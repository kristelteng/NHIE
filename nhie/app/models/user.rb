class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true

  # added validation true for image
  validates :image, presence: true

  has_many :friendships, :dependent => :destroy
  # has_many :friends, :through => :friendships, class_name: "User"

  def friends
    friendships.where(accepted: true).map(&:friend)
  end
  
  has_many :events, :through => :friends, :class_name => 'Event', :source => :events
  has_many :events

  # %w[accepted requested pending].each do |status|
  #   define_method("#{status}_friends") do
  #     friendships.where(status: status).map(&:friend)
  #   end
  # end

  # def incoming
  #   Friendship.where(friend: self)
  # end

  # def outgoing
  #   Friendship.where(user: self)
  # end

  def outgoing_friend_requests
    # outgoing.select {|f| not incoming.include?(f) }
    # me -> someone
    friendships.where(accepted: false)
  end

  def incoming_friend_requests
    # me <- someone
    Friendship.where(friend: self, accepted: false)
  end

  def request_friendship!(friend)
    Friendship.create(user: self, friend: friend, accepted: false)
  end

  def accept_friendship!(friend)
    # f = Friendship.find_by(user: friend, friend: self)
    f = incoming_friend_requests.find_by(user: friend)
    f.accepted = true
    f.save!

    Friendship.create(user: self, friend: friend, accepted: true)
  end

  def deny_friendship!(friend)
    f = incoming_friend_requests.find_by(user: friend)
    f.destroy
  end

  def friends?(other)
    friends.include? other
  end

  # Warning: This is for admin use
  def enfriend!(friend)
    friendships.create(friend: friend)
    friend.friendships.create(friend: self)
  end

  def unfriend!(enemy)
    friendships.find_by(friend: enemy).destroy
    enemy.friendships.find_by(friend: self).destroy
  end

  def inspect
    "<User #{id}: #{first_name} #{last_name} (#{email})>"
  end

end