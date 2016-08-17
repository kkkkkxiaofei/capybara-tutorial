module PageWithShowPost
	include Gizmo::PageMixin

	def valid?
		has_selector?('#show')
	end

	def notice_message
		find('#notice').text
	end

	def post_title
		find('#show-title').text
	end

	def post_content
		find('#show-content').text
	end

	def back_link
		find('a[href="/posts"]')
	end

end