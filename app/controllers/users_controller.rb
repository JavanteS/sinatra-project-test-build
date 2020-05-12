class UsersController < ApplicationController 

    configure do
        enable :sessions
        set :session_secret, "secret"
      end

      

     get "/signup" do
            
      erb :'/users/signup'
      
     end 

     post "/signup" do 
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