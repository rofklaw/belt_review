class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  #validations
  validates :content, presence: true, length: {in: 2..255}
end
