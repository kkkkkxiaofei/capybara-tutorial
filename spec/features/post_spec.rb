require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    sleep(5)
    on_page_with :post_list do |post_list_page|

        post_title = 'my first post'
        post_content = 'I wanna be the full-stack dev'

        expect(post_list_page.posts_in_list.length).to eq(0)
        sleep(1)
        post_list_page.new_post_link.click
        sleep(1)

        on_page_with :new_post do |new_post_page|
            new_post_page.perform :fill_post, post_title, post_content
            sleep(1)
            new_post_page.create_post_button.click
        end
        
        sleep(1)
        
        on_page_with :show_post do |show_post_page|
            expect(show_post_page.notice_message).to eq('Post was successfully created.')
            show_post_page.back_link.click
        end

        post_list = post_list_page.posts_in_list

        expect(post_list.length).to eq(1)
        expect(post_list_page.get_post_title(0)).to eq(post_title)
        expect(post_list_page.get_post_content(0)).to eq(post_content)

        sleep(5)

        on_page_with :top_post do |top_post_page|
            top_post_list = top_post_page.top_post_list
            expect(top_post_list.length).to eq(1)
            expect(top_post_page.get_post_title(0)).to eq(post_title)
        end

    end
  end
end
