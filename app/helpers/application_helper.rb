module ApplicationHelper
  def full_title(page_title)
    base_title = "Main Street Station"
    return base_title if page_title.empty?
    return "#{base_title} | #{page_title}"
  end
end