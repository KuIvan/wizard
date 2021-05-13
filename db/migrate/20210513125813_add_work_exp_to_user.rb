class AddWorkExpToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :work_experiences, :user, index: true, foreign_key: true
  end
end
