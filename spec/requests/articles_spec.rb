require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @article = Article.create(title: "Title one", body: "Body of the article")
  end
  
  describe 'GET /article/:id' do
    context 'with existing article' do
      before { get "/articles/#{@article.id}" }
      
      it "handles existing articles" do
        expect(response.status).to eq 200
      end
    end
    
    context "with not existing article" do
      before do
        get "/articles/67"
      end
      
      it "handles not existing article" do
        expect(response.status).to eq 302
        flash_message = "Article you are looking for couldn't be found"
        expect(flash[:danger]).to eq flash_message
      end
    end
  end
end