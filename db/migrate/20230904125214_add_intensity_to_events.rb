class AddIntensityToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :intensity, :string
  end
end
