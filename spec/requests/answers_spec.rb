require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe "Answers", type: :request do
  let(:answer) { answers(:answer_1) }

  describe "edit answer" do
    before { get "/answers/#{answer.id}/edit" }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "new answer" do
    let(:question) { questions(:question_2) }
    before { get '/answers/new', params: { answer: { parent_id: question.id } } }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "create answer" do
    let(:question) { questions(:question_2) }

    before { post '/answers', params: { answer: { description: "Test 3", parent_id: question.id } } }
    it "works" do
      expect(response).to have_http_status(302)
      expect(TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size).to match(1)
    end

  end

  describe "create new answer" do
    let(:question) { questions(:question_2) }
    it "works" do
      block = -> { post '/answers', params: { answer: { description: "Test 3", parent_id: question.id } } }
      expect(block).to change { Answer.count }.by(1)
    end

    it "worker works" do
      block = -> { post '/answers', params: { answer: { description: "Test 3", parent_id: question.id } } }
      expect(block).to change { TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size }.by(1)
    end
  end

  describe "create answer" do
    let(:question) { questions(:question_2) }

    before { patch "/answers/#{answer.id}/", params: { answer: { description: "Test 3", parent_id: question.id } } }
    it "works" do
      expect(response).to have_http_status(302)
      expect(answer.reload.description).to match("Test 3")
    end

    it "worker works" do
      block = -> { patch "/answers/#{answer.id}/", params: { answer: { description: "Test 3", parent_id: question.id } } }
      expect(block).to change { TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size }.by(1)
    end
  end

  describe "destroy answer" do
    #before { delete "/answers/#{answer.id}/", params: { answer: { description: "Test 3" } } }
    it "works" do
      block = -> { delete "/answers/#{answer.id}" }
      expect(block).to change { Answer.count }.by(-1)
    end
  end
end
