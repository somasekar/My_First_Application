class PagesController < ApplicationController

#  before_filter :is_logged_in, :only => [:about, :help]
 before_filter :is_logged_in
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact Us"
  end

  def about
    @title = "About Us"
  end

  def help
    @title = "Help"
  end
  
end
