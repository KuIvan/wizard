class AddCountryToWorkExp < ActiveRecord::Migration[6.1]
  def change
    add_reference :work_experiences, :country, index: true, foreign_key: true
  end
end
