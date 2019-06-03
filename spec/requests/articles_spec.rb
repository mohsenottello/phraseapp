require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:article) { articles(:article_1) }
  describe "index articles" do
    before { get '/articles' }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "show article" do
    before { get "/articles/#{article.id}" }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "edit article" do
    before { get "/articles/#{article.id}/edit" }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "new article" do
    before { get '/articles/new' }
    it "works" do
      expect(response).to have_http_status(200)
    end
  end

  describe "create article" do
    before { post '/articles', params: { article: { description: "Test 3" } } }
    it "works" do
      expect(response).to have_http_status(302)

      block = -> { post '/articles', params: { article: { description: "Test 3" } } }
      expect(block).to change { Article.count }.by(1)
    end

    it "worker works" do
      block = -> { post '/articles', params: { article: { description: "Test 3" } } }
      expect(block).to change { TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size }.by(1)
    end
  end

  describe "update article" do
    before { patch "/articles/#{article.id}/", params: { article: { description: "Test 3" } } }
    it "works" do
      expect(response).to have_http_status(302)
      expect(article.reload.description).to match("Test 3")
    end

    it "worker works" do
      block = -> { patch "/articles/#{article.id}/", params: { article: { description: "Test 3" } } }
      expect(block).to change { TranslationService::Workers::UpdateGermanDescriptionWorker.jobs.size }.by(1)
    end
  end

  describe "destroy article" do
    #before { delete "/articles/#{article.id}/", params: { article: { description: "Test 3" } } }
    it "works" do
      block = -> { delete "/articles/#{article.id}" }
      expect(block).to change { Article.count }.by(-1)
    end
  end
end
