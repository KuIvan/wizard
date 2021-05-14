require 'rails_helper'
RSpec.describe InterestsUser, type: :model do
  it { should belong_to(:user).optional(false) }
  it { should belong_to(:interest).optional(false) }
end