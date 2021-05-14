require 'rails_helper'
RSpec.describe Interest, type: :model do
  it { should have_many(:interests_users).dependent(:destroy) }
  it { should have_many(:users).through(:interests_users) }
end