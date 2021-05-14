require 'rails_helper'
RSpec.describe Country, type: :model do
  it { should have_many(:users).dependent(:nullify) }
  it { should have_many(:work_experiences).dependent(:nullify) }
end
