class MainController < ApplicationController
 protect_from_forgery

 def index
  if Rails.env.production?
   {:host => "www.halalgami.tk"}
  else
  {}
  end 
 end
 
private
 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 helper_method :current_user

 def authorize
  redirect_to signin_url, alert: "Not authorized" if current_user.nil?
 end

end
