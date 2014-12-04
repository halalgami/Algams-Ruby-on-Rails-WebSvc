class MainController < ApplicationController
 protect_from_forgery
 @source_cont = "none"

 def index
  #defining custom home page
  @source_cont = "index"
  #render "main/custom_index.html.erb"

  #the previous routing stuff
  if Rails.env.production?
   {:host => "www.halalgami.tk"}
  else
  {}
  end
 end

 def not_found
  @source_cont = "notfound"
  render "layouts/application.html.erb"
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
