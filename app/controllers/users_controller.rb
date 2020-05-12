class UsersController < ApplicationController 

    configure do
        enable :sessions
        set :session_secret, "secret"
      end

      

     get "/signup" do
      if logged_in?
        redirect "/games"
      end 

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

     get "/login" do 
      if logged_in?
        redirect "/games"
      else
        erb :"/sessions/login"
      end
      
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
     
     get "/logout"
        if logged_in?
          session.clear 
          redirect "/login"
        else
         redirect "/"
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