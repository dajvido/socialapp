require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:message)).to be_valid
  end

  it 'is invalid without content' do
    expect(FactoryGirl.build(:message, { content: nil })).not_to be_valid
  end

  it 'is invalid with content less than 2 characters' do
    expect(FactoryGirl.build(:message, { content: "1" })).not_to be_valid
  end

  it 'is invalid with content longer than 140 characters' do
    expect(FactoryGirl.build(:message, { content: "1" * 141 })).not_to be_valid
  end

  # it { should belongs_to(:user) }
  # it { should validate_presence_of(:content) }
  # it { should validate_length_of(:content, minimum: 2, maximum: 140) }

end
