class ChangeColumnToCoaches < ActiveRecord::Migration[6.0]
  def change
    change_column :coaches, :name, :string
  end
end
