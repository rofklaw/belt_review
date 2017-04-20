class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :attendees
  has_many :users, through: :attendees

  #validations
  validates :city, presence: true, length: { in: 2..30 }
  validates :state, presence: true, length: {is: 2}
  validates :date, presence: true

end
