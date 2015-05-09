class Message < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true, length: { minimum: 2, maximum: 140 }
end
