require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    sleep(5)
    on_page_with :post_list do |post_list_page|
        expect(post_list_page.posts_in_list.length).to eq(0)
        sleep(1)
        post_list_page.new_post_link.click
        sleep(1)
        on_page_with :new_post do |new_post_page|
            new_post_page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
            sleep(1)
            new_post_page.create_post_button.click
        end
        sleep(1)
        on_page_with :show_post do |show_post_page|
            expect(show_post_page.notice_message).to eq('Post was successfully created.')
            show_post_page.back_link.click
        end
        expect(post_list_page.posts_in_list.length).to eq(1)
    end
  end
end
