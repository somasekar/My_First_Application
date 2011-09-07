class ApplicationController < ActionController::Base
  protect_from_forgery
    def is_logged_in
    if session[:id].nil?
      redirect_to new_session_path and return
    end
  end
end
