class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile was updated successfully."
      redirect_to user_path(@user)  # short for article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account creation for Beta Blog was successful. Welcome #{@user.username}!"
      redirect_to articles_path
    else
    render "new", status: :unprocessable_entity
    end
  end

  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end