module PageWithTopPost
	include Gizmo::PageMixin

	def valid?
		has_selector?('#top')
	end

	def top_post_list
		find('.top-10-list').all('.top-item')
	end

	def get_post_title post_item_index
		top_post_list[post_item_index].text
	end
	
end