require 'rails_helper'
RSpec.describe Language, type: :model do
  it { should have_many(:users).dependent(:nullify) }
end