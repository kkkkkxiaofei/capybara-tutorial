module PageWithTopPost
	include Gizmo::PageMixin

	def valid?
		has_selector?('#top')
	end

	def top_post_list
		find('.top-10-list').all('.top-item')
	end
	
end