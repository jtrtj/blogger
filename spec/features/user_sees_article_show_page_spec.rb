require 'rails_helper'

describe 'user sees on article' do
  describe 'they link from articles index' do
    it 'diplays information for one article' do
      article = Article.create!(title: 'test article', body: 'testing testing 123')

      visit articles_path
      click_link article.title

      expect(current_path).to eq("/articles/#{article.id}")
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end