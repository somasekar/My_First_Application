class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  def create
    user = User.authenticate(params[:session][:user_name], params[:session][:password])
    if user.nil?
      
      flash[:notice] = "Invalid Username or Password combination."

      render 'new'
    else
      session[:id] = user.id
      flash[:notice] = "You are now successfully logged in."
      redirect_to(:controller => "pages", :action => "contact")
    end
  end
 def sign_in(user)
   session[:id] = user.id
    self.current_user = user
  end
def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def signout
    session[:id]=nil
    flash[:notice] = "You have been successfully logged out."
    redirect_to(:action=>"new")
  end
end

