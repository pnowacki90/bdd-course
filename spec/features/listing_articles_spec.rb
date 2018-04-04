require 'rails_helper'

RSpec.feature "Listing Articles" do
  
  before do
    @article1 = Article.create(title: "First article", body: "This is the first article")
    @article2 = Article.create(title: "Second article", body: "This is the second article")
  end
  
  scenario "A user lists all articles" do
    visit articles_path
    
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
  
  scenario "A user has no articles" do
    Article.delete_all
    visit articles_path
    
    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)
    
    within("h1#no-articles") do
      expect(page).to have_text("No articles created!")
    end
  end
end