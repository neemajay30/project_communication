class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :content, presence: true, length: { minimum: 1 }

  scope :recent, -> { order(created_at: :desc) }

  def status?
    event_type == "status_update"
  end
end
