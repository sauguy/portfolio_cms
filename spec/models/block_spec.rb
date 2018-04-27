# frozen_string_literal: true

require 'rails_helper'

describe Block, type: :model do
  subject { FactoryBot.create(:block) }

  it { should have_many :elements }
  it { should belong_to :page }
  it { should respond_to :weight }
end
