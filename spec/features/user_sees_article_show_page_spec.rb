require 'rails_helper'

describe 'user sees on article' do
  describe 'they link from articles index' do
    it 'diplays information for one article' do
      article = Article.create!(title: 'test article', body: 'testing testing 123')
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")

      visit articles_path

      click_link article.title

      expect(current_path).to eq("/articles/#{article.id}")
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end