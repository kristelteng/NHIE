class Event < ActiveRecord::Base
  validates :event_name, presence: true
  validates :description, presence: true
  validates :event_datetime, presence: true
  validates :event_name, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :participation
  has_many :participants, through: :participation, source: :user
end
