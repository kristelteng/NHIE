class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :username, uniqueness: true

  # added validation true for image
  validates :image, presence: true

  has_many :friends, :through => :friendships
  has_many :friendships
  has_many :events, :through => :friends, :class_name => 'Event', :source => :events
  has_many :events
  # has_many :comments
end