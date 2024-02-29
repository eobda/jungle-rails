class SessionsController < ApplicationController
  def new
  end

  def create #login
    user = User.find_by_email(params[:email])
    
    if user = user.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy #logout
    session[:user_id] = nil
    redirect_to '/login'
  end

end
