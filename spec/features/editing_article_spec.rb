require 'rails_helper'

RSpec.feature "Edit an article" do
  before { @article = Article.create(title: "Sample article", body: "Text of a sample article") }
  
  scenario "user edits an article" do
    visit '/'
    
    click_link @article.title
    click_link "Edit"
    fill_in "Title", with: "Updated title"
    fill_in "Body", with: "Updated body"
    click_button "Update"
    expect(page).to have_content("Article updated")
    expect(page.current_path).to eq(article_path(@article))
  end
  
  scenario "user fails to edit an article" do
    visit '/'
    
    click_link @article.title
    click_link "Edit"
    fill_in "Title", with: ""
    fill_in "Body", with: "Updated body"
    click_button "Update"
    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end