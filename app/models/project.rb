class Project < ApplicationRecord
  attr_accessor :current_user

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, allow_blank: true

  enum :status, { draft: "draft", in_progress: "in_progress", completed: "completed" }

  after_update :audit_status, if: :saved_change_to_status?
  after_create :audit_status

  private

  def audit_status
    comment = comments.build(
      user: current_user || user,
      event_type: "status_update",
      properties: { status: [ status_previously_was, status ] },
      content: build_status_change_message
    )
    comment.save
  end

  def build_status_change_message
    previous = status_previously_was.to_s.humanize
    current = status.to_s.humanize
    "Status has changed " + (
      previous == current ? "'#{current}'" : "'#{previous}' to '#{current}'"
    )
  end
end
