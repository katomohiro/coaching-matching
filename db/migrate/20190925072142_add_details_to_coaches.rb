class AddDetailsToCoaches < ActiveRecord::Migration[6.0]
  def change
    add_column :coaches, :name, :integer
    add_column :coaches, :nickname, :string
    add_column :coaches, :thumbnail, :string
    add_column :coaches, :description, :text
    add_column :coaches, :contact, :text
  end
end
