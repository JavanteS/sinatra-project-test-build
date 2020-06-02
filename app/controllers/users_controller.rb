class UsersController < ApplicationController 

   
   get "/signup" do
      redirect_if_logged_in 
      erb :'/users/signup'
   end 

   post "/signup" do
      is_it_blank
      user =User.create(params)
      redirect "/login"
   end 

   get "/login" do 
      redirect_if_logged_in
      erb :"/sessions/login"
   end 

   post "/login" do
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
	 session[:user_id] = user.id
         redirect "/games"
      else
	 redirect "/login"
      end 
   end
     
   get "/logout" do
      redirect_if_not_logged_in
      session.clear 
      redirect "/"
   end 
end
