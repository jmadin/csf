class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: [:destroy, :new]

  def index
    @users = User.all.search(params[:search]).sort_by{ |h| h.name }
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(10)
  end

  def show
      @user = User.find(params[:id])      
      # @datasets = Dataset.where(:user_id => @user.id).sort_by{ |h| [h.id] }
  end
    
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User removed"
    redirect_to users_url
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Student Meta-data."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
