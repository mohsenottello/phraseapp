require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { described_class.new }

  describe 'model_invalid' do
    it "is not valid without description" do
      expect(subject).to_not be_valid
    end

    it "is not valid without article" do
      article = articles(:article_1)
      subject.attributes = { article: article }
      expect(subject).to_not be_valid
    end
  end

  describe 'model_valid' do
    it "should valida with all data" do
      article = articles(:article_1)
      subject.attributes = { description: "test", article: article }
      expect(subject).to be_valid
    end
  end
end
