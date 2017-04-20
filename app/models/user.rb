class User < ActiveRecord::Base
  has_many :comments
  has_many :attendees
  has_many :events
  has_many :events_attending, through: :attendees, source: :event
  has_secure_password

  #validations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, presence: true, length: { in: 2..30 }
  validates :state, presence: true, length: {is: 2}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
