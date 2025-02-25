class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  scope :recent, -> { order(created_at: :desc) }
end
