require 'rails_helper'

describe Page, type: :model do
  subject { FactoryBot.create(:page) }

  it { should have_many :blocks }
end