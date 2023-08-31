class SessionsController < ApplicationController
    
  def new
  end

  def create
    user = User.find_by(email: params[:session] [:email].downcase)
    if user && user.authenticate(params[:session] [:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully logged in as #{user.username}"
      redirect_to user
    else
      flash.now[:alert] = "Login details incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Log out successful"
    redirect_to root_path
  end

end