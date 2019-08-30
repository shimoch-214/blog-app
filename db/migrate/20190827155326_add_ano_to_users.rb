class AddAnoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ano, :string
  end
end
