require 'rails_helper'

RSpec.feature "Deleting article" do
  before { @article = Article.create(title: "Sample article", body: "Text of a sample article") }

  scenario "User deletes an article" do
    visit '/'
    click_link @article.title
    click_link "Delete"
    
    expect(page).to have_content("Article deleted")
    expect(current_path).to eq(articles_path)
  end
end