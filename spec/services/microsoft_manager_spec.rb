require 'rails_helper'

RSpec.describe TranslationService::MicrosoftManager, type: :feature do
  describe "Test Functionality TranslationService::MicrosoftManager" do
    let(:test_content) { "Test Content" }

    it "enqueues a communication worker" do
      expect(TranslationService::MicrosoftManager.translate(content: test_content)).to match(test_content)
    end
  end
end
