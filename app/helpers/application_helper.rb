module ApplicationHelper
  def offices_links
    @offices.map do |office|
      link_to_unless(@office == office, office.name, index_path(office.permalink))
    end.map do |link|
      content_tag(:span, link)
    end.join(" ").html_safe
  end
end
