class UsersController < ApplicationController 

    configure do
        enable :sessions
        set :session_secret, "secret"
      end

      

     get "/signup" do

      erb :'/users/signup'
      
     end 

     post "/signup" do
      #binding.pry
      if params[:username].blank? || params[:email].blank? || params[:password].blank?
        redirect to "/signup"
      end 
      user =User.create(username: params[:username], email: params[:email], password:  params[:password])
      session[:user_id] = @user.id
      redirect "/games"
     end 

     helpers do
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end
    end



end