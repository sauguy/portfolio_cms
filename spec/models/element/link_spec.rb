# frozen_string_literal: true

require 'rails_helper'

describe Element::Link, type: :model do
  subject { FactoryBot.create(:link) }

  it { should belong_to :element }
  it { should respond_to :title }
  it { should respond_to :target }
  it { should respond_to :img }
  it { should respond_to :description }
  it { should respond_to :weight }
  it { should respond_to :block }
end
