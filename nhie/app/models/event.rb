class Event < ActiveRecord::Base
  validates :event_name, presence: true
  validates :description, presence: true
  validates :event_datetime, presence: true
  validates :event_name, presence: true

  belongs_to :user
  has_many :users
  
end
