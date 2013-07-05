class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy]
  before_filter :signed_out_user, only: [:new, :create]
  
  def index
    @title = 'All users'
    @users = User.paginate(page: params[:page])    
  end

  def new
  	@title = 'Sign up'
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  	@microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit
    @title = 'Edit user'
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = 'Profile updated'
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if !current_user?(user)
      user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    else
      flash[:error] = "You can't delete yourself!"
      redirect_to root_url
    end 
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def signed_out_user
      redirect_to(root_path) unless !signed_in?
    end

end
