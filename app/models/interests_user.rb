class InterestsUser < ApplicationRecord

  belongs_to :user, optional: false
  belongs_to :interest, optional: false

end
