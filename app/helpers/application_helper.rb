module ApplicationHelper
  def full_title page_title = ""
    base_title = t "helpers.application_helper.my_shop"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
