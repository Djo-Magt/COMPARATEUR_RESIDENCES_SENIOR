class AddUserToResidences < ActiveRecord::Migration[7.1]
  def change
    add_reference :residences, :user, null: false, foreign_key: true
  end
end
