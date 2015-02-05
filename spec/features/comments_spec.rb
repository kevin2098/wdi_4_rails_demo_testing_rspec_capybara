require 'rails_helper'

RSpec.feature 'Managing comments in articles' do
  scenario 'List all comments' do
    article = Article.create!(title: 'title', body: 'body')
    Comment.create!(body: 'This is a comment', article: article)


    visit "articles/#{article.id}/comments"

    expect(page).to have_content 'Comments'
    expect(page).to have_selector 'body', count: 1
  end

  scenario 'Create a comment' do
    article = Article.create!(title: 'title', body: 'body')
    visit "/article/#{article.id}/comments/new"

    fill_in body: 'This is a comment'
    click_on 'Create Comment'

    expect(page).to have_content(/success/i)
  end


end


