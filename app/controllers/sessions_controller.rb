class SessionsController < ApplicationController
  
  def new

  end

  def create
  	user = User.find_by(username: params[:session][:username])
  	if user && user.authenticatte(params[:session][:password])
  		log_in(user)
  		redirect_to user
  	else
  		flash.now[:danger] = "wrong input"
  		render 'new'
  end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
