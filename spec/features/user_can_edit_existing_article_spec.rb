require 'rails_helper'

describe 'user edits an existing article' do
  describe 'they link from articles index' do
    describe 'they fill in a new title and body' do
      it 'edits the selcted article' do
        article = Article.create!(title: 'this will change', body: 'so will this')

        visit "articles/#{article.id}"
        click_link 'Edit'

        expect(current_path).to eq("/articles/#{article.id}/edit")

        fill_in 'article[title]', with: 'updated title'
        fill_in 'article[body]', with: 'updated body'
        click_on 'Update Article'

        expect(current_path).to eq("/articles")
        expect(page).to have_content('article.title')
      end
    end
  end
end