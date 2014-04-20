class SessionsController < ApplicationController
  def new
  end

  def create
   user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      user.api_keys.create!
      session[:user_id] = user.id
      #redirect_to lists_url, notice: "Logged in!"
      case request.format
       when Mime::JSON
        format.json { render json: @session, status: :created }
       else
        redirect_to btc_gsm_sig_survs_path, notice: "Logged in!"
       end
    else
      flash.now.alert = "Invalid username or password"
      #render "new"
      redirect_to root_url
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "Logged out!"
   #redirect_to signout_url, notice: "Logged out!"
  end
end
