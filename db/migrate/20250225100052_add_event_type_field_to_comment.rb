class AddEventTypeFieldToComment < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :event_type, :string, default: 'comment'
  end
end
