class AddNomPrenomToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :prenom, :string, null: false, default: ""
    add_column :users, :nom, :string, null: false, default: ""
  end
end
