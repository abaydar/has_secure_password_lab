class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    end
  end
  
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id 
    redirect_to login_path
  end

end
