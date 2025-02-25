module ApplicationHelper
  def status_badge(status)
    base_classes = "inline-block px-3 py-1 text-sm font-semibold rounded-full border"
    color_classes = case status
    when "draft"
      "bg-yellow-100 text-yellow-800 border-yellow-300"
    when "in_progress"
      "bg-blue-100 text-blue-800 border-blue-300"
    when "completed"
      "bg-green-100 text-green-800 border-green-300"
    else
      "bg-gray-100 text-gray-800 border-gray-300"
    end
    "#{base_classes} #{color_classes}"
  end


  def my_comment?(comment)
    comment.user_id == current_user.id
  end
end
