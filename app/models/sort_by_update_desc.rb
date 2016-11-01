class SortByUpdateDesc < SortTemplate

	def sort_attr
		"updated_at"
	end

	def keyword_attr
	    "desc"
	end

end