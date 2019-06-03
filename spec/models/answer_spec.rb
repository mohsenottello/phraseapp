require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { described_class.new }

  describe 'model_invalid' do
    it "is not valid without description" do
      expect(subject).to_not be_valid
    end

    it "is not valid without question" do
      question = questions(:question_1)
      subject.attributes = { question: question }
      expect(subject).to_not be_valid
    end

    it "is not valida with all data but same question" do
      question = questions(:question_1)
      subject.attributes = { description: "test", question: question }
      expect(subject).to_not be_valid
    end
  end

  describe 'model_valid' do
    it "should valida with all data" do
      question = questions(:question_2)
      subject.attributes = { description: "test", question: question }
      expect(subject).to be_valid
    end
  end
end
