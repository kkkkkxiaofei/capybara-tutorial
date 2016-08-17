module PageWithPostList
	include Gizmo::PageMixin

	def valid?
		has_css?('.parent .left')
	end

	def posts_in_list
		find('.parent .left table').find('tbody').all('tr')
	end

	def new_post_link
		find('.parent .left a[href="/posts/new"]')
	end

	def create_post_button
		find('.actions input[value="Create Post"]')
	end

	def get_post_title post_item_index
		posts_in_list[post_item_index].find('.post-item-title').text
	end

	def get_post_content post_item_index
		posts_in_list[post_item_index].find('.post-item-content').text
	end

end