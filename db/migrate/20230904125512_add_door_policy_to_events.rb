class AddDoorPolicyToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :door_policy, :string
  end
end
