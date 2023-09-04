class AddQueuingTimeToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :queuing_time, :string
  end
end
