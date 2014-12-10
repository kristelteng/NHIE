class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true

  # added validation true for image
  validates :image, presence: true

  has_many :friends, :through => :friendships, :conditions => "'status = 'accepted'" 
  has_many :requested_friends, :through => :friendships, :source => :friends, :conditions => "status = 'requested'"
  has_many :pending_friends, :through => :friendships, :source => :friends, :conditions => "status = 'pending'"
  has_many :friendships, :dependent => :destroy

  has_many :events, :through => :friends, :class_name => 'Event', :source => :events
  has_many :events
end