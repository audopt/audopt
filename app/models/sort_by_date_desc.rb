class SortByDateDesc < SortTemplate
    
  def sort_attr
    "created_at"
  end

  def keyword_attr
    "desc"
  end

end
