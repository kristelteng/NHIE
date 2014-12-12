class Event < ActiveRecord::Base
  validates :event_name, presence: true
  validates :description, presence: true
  validates :event_datetime, presence: true
  validates :event_name, presence: true
  validates :user_id, uniqueness: { scope: :event_id, message: "can only participate once per event" }

  belongs_to :creator, class_name: 'User'
  has_many :participation
  has_many :participants, through: :participation, source: :user
end
