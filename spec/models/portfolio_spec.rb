require 'rails_helper'

describe Portfolio, type: :model do
  subject { FactoryBot.create(:portfolio) }
  it { should have_many(:pages).dependent(:destroy) }
end
