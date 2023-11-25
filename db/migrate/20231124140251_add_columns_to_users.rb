class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :text, default: ""
    add_column :users, :image, :string, null: true, default: ""
  end
end
