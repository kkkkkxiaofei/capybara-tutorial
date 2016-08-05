require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    sleep(1)
    click_link('New Post')
    fill_in('post_title', with: 'my first post')
    fill_in('post_content', with: 'my first content')
    click_button('Create Post')
    sleep(1)
    expect(page).to have_content('Post was successfully created')

    visit '/'
    sleep(1)
    expect(page).to have_content('my first post')
    expect(page).to have_content('my first content')
    expect(page).to have_content('TOP 10 Posts')
    expect(page).to have_content('initialize component')
    expect(page).to have_content('start loading...')
    expect(page).to have_selector('ul li')
    expect(find('ul li')).to have_content('my first post')
  end
end
