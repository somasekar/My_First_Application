module UsersHelper
  def title
    title = "Sumeru on Rails"
    if @title.nil?
      title
    elsif
      @title == ""
      title
    else
      "#{title} | #{@title}"
    end
  end
  def gravatar_for(user, options = { :default => logo.png , :size => 50 })
  gravatar_image_tag(user.email.downcase, :alt => user.first_name,
                                          :class => 'gravatar',
                                          :gravatar => options)
end
  end

