require 'rails_helper'

describe 'user creates a new article' do
  describe 'they link from articles index' do
    describe 'they fill in a title and body' do
      it 'creates a new article' do
        visit articles_path
        click_link 'Create a New Article'

        expect(current_path).to eq(new_article_path)

        fill_in 'article[title]', with: 'Test Title!'
        fill_in 'article[body]', with: 'Test Bod.'
        click_on 'Create Article'

        expect(page).to have_content('Test Title!')
        expect(page).to have_content('Test Bod.')
      end
    end
  end
end