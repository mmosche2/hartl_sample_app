module ApplicationHelper

	def full_title(page_title)
		base = "ROR Sample"
		if !page_title || page_title.empty?
			base
		else
			"#{base} | #{page_title}"
		end
	end

end
