require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:question) { questions(:question_1) }

  describe "edit question" do
    before { get "/questions/#{question.id}/edit" }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "new question" do
    let(:article) { articles(:article_1) }
    before { get '/questions/new', params: { question: { parent_id: article.id } } }

    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "create question" do
    let(:article) { articles(:article_1) }

    before { post '/questions', params: { question: { description: "Test 3", parent_id: article.id } } }
    it "works" do
      expect(response).to have_http_status(302)

      block = -> { post '/questions', params: { question: { description: "Test 3", parent_id: article.id } } }
      expect(block).to change { Question.count }.by(1)
    end

    it "worker works" do
      block = -> { post '/questions', params: { question: { description: "Test 3", parent_id: article.id } } }
      expect(block).to change { TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size }.by(1)
    end
  end

  describe "create question" do
    let(:article) { articles(:article_1) }

    before { patch "/questions/#{question.id}/", params: { question: { description: "Test 3", parent_id: article.id } } }
    it "works" do
      expect(response).to have_http_status(302)
      expect(question.reload.description).to match("Test 3")
    end

    it "worker works" do
      block = -> { patch "/questions/#{question.id}/", params: { question: { description: "Test 3", parent_id: article.id } } }
      expect(block).to change { TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size }.by(1)
    end
  end

  describe "destroy question" do
    #before { delete "/questions/#{question.id}/", params: { question: { description: "Test 3" } } }
    it "works" do
      block = -> { delete "/questions/#{question.id}" }
      expect(block).to change { Question.count }.by(-1)
    end
  end
end
