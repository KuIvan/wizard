class AddRelationsToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :language, index: true, foreign_key: true
    add_reference :users, :country, index: true, foreign_key: true
  end
end
