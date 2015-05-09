class Message < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true, length: { minimum: 2, maximum: 140 }
end
