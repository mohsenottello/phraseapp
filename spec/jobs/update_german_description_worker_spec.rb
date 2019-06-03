require 'rails_helper'

RSpec.describe TranslationService::Workers::UpdateGermanDescriptionWorker, type: :job do
  describe "Test Functionality UpdateGermanDescriptionWorker" do
    let(:article) { articles(:article_1) }

    before { TranslationService::Workers::UpdateGermanDescriptionWorker.new.perform(article.id) }
    it "enqueues a communication worker" do
      expect(article.reload.description).to match(article.description_de)
    end
  end
end
