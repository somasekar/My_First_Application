module PagesHelper
  def title
  text = "Sumeru on Rails"
  if @title.nil?
    text
  elsif
    @title == ""
    text
  else
   "#{text} | #{@title}"
  end
end
end
