class RemoveNullConstraintFromEventsClubId < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :club_id, :bigint, null: true
  end
end
