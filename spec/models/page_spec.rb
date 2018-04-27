# frozen_string_literal: true

require 'rails_helper'

describe Page, type: :model do
  subject { FactoryBot.create(:page) }

  it { should have_many :blocks }
  it { should belong_to :portfolio }
end
