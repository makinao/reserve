class RenameTypeColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :type, :content
  end
end
