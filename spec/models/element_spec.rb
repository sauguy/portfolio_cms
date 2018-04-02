require 'rails_helper'

describe Element, type: :model do
  subject { FactoryBot.create(:element) }

  it { should belong_to :block }
  it { should respond_to :weight }
end
