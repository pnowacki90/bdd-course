require 'rails_helper'

RSpec.feature "Show article" do
  before { @article = Article.create(title: "Sample article", body: "Text of a sample article") }
  
  scenario "user displays an article" do
    visit article_path(@article)
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
  
  #scenario "user tries to view not existing article" do
  #  visit article_path(art)
  #  expect(page).to 
  #end
end