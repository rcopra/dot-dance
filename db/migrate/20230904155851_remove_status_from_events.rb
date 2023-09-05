class RemoveStatusFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :status, :integer
  end
end
