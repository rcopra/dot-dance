class AddGenreToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :genre, :string
  end
end
