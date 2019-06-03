require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { described_class.new }

  describe 'model_invalid' do
    it "is not valid without description" do
      expect(subject).to_not be_valid
    end
  end

  describe 'model_valid' do
    it "should valida with all data" do
      subject.attributes = { description: "test" }
      expect(subject).to be_valid
    end
  end
end
