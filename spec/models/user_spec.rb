require 'rails_helper'
RSpec.describe User, type: :model do
  it { should belong_to(:country).optional(true) }
  it { should belong_to(:language).optional(true) }

  it { should have_many(:work_experiences).dependent(:destroy) }
  it { should have_many(:interests_users).dependent(:destroy) }
  it { should have_many(:interests).through(:interests_users) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
end