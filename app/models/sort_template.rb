class SortTemplate < ActiveRecord::Base

  def sort_attr
    raise NotImplementedError, 'Sort attribute has to be overrided'
  end

  def keyword_attr
    raise NotImplementedError, 'Keyword attribute has to be overrided'
  end

  def sort_posts
    attribute = sort_attr
    keyword = keyword_attr

    Post.order(attribute + " " + keyword)
  end
  
end
