class GamesController < ApplicationController 
    
    configure do
        enable :sessions
        set :session_secret, "secret"
      end


      get "/games" do 
        #binding.pry
        @games = Game.all 
        erb :"/games/index"
      end 

      get "/games/new" do 
        

        
      end 

      post "/games" do 
      end 

      get "/games/:id" do 
      end 

      get "/games/:id/edit" do 
      end 

      patch "/games/:id" do 
      end
      
      delete "/games/:id/delete" do 
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