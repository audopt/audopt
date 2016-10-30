class SortByDateAsc < SortTemplate
    
  def sort_attr
    "created_at"
  end

  def keyword_attr
    "asc"
  end

end
