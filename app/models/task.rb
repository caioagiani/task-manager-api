class Task < ApplicationRecord
  belongs_to :user

  # validate_presence_of :title, :user_id
  validates :title, :user_id, presence: true
end
