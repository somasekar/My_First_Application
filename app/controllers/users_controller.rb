class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  before_filter :is_logged_in, :only => [:show, :edit]
  #  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  #  before_filter :correct_user, :only => [:edit, :update]
  #  before_filter :admin_user,   :only => :destroy

  def index
   
    #    @users = User.paginate(:page => 1, :per_page => 30)
    #    @users = User.paginate :per_page => 10, :page => params[:page]
    #paginate  :per_page=>20, :page => page,
    #              :conditions =>["#{code.upcase} like ?","%#{search}%"],
    #              :order => "DLXDAT desc"

    @title = "Index"
    @users = User.all
    @users = @users.paginate(:page => params[:page], :per_page => 3)


    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @users }
    #    end
  end
  


  #  def authenticate(user_name,password)
  #    @user = User.find_by_user_name_and_password(user_name,password)
  #  end

  #  def login
  #    @user = User.find(params[:id])
  #    render :controller => "users", :action => "login"
  #  end
  def home
    @title = "home"
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @title = "Show"
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @title = "Signup"
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit

  def edit
    @title = "Edit"
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @title = "Create"
        @user = User.new(params[:user])
#    @user = User.create(params[:user])
    #    raise @user.inspect
    if @user.save
      redirect_to :action => "index"
    else
#      raise @user.errors.full_messages.inspect
      render :action => "new"
    end
  end

  respond_to do |format|
    if @user.save
      format.html { redirect_to(@user, :notice => 'You have been successfully created your profile.') }
      format.xml  { render :xml => @user, :status => :created, :location => @user }
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @title = "Update"
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'You have been successfully updated your profile.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @title = "Destroy"
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  #  private
  #  def admin_user
  #    redirect_to(root_path)unless current_user.admin?
  #  end
  #  private

  #  def authenticate
  #    deny_access unless sign_in?
  #  end
  #  def correct_user
  #    @user = User.find(params[:id])
  #    redirect_to(edit_user)
  #  end
  #  def sign_in(user)
  #    dhgdh
  #   session[:id] = user.id
  #    self.current_user = user
  #  end
end
