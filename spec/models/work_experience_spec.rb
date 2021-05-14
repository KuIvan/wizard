require 'rails_helper'
RSpec.describe WorkExperience, type: :model do

  it { should belong_to(:user).optional(false) }
  it { should belong_to(:country).optional(true) }

  it { should validate_presence_of(:start_at) }
  it { should validate_presence_of(:organization_name) }
  it { should validate_presence_of(:end_at) }
end