class Country < ApplicationRecord

  has_many :users, dependent: :nullify
  has_many :work_experiences, dependent: :nullify

end
