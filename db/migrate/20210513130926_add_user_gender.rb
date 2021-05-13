class AddUserGender < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :integer, default: nil
  end
end
