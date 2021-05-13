class CreateInterestsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :interests_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :interest, index: true, foreign_key: true
      t.timestamps
    end
  end
end
