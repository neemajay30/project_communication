class Project < ApplicationRecord
  attr_accessor :current_user
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, allow_blank: true

  # Define the enum for status
  enum :status, { draft: "draft", in_progress: "in_progress", completed: "completed" }

  after_save :audit_status, if: :saved_change_to_status?

  private

  def audit_status
    comment = comments.new(user: current_user)
    comment.properties = {
      status: [ status_previously_was, status ]
    }
    comment.content = "Status has changed '#{status_previously_was.to_s.humanize}' to '#{status.to_s.humanize}'"
    comment.save
  end
end
