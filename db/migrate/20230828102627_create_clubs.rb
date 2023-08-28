class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
