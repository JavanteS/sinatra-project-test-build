class GamesController < ApplicationController 
    
    configure do
        enable :sessions
        set :session_secret, "secret"
      end


      get "/games" do 
        #binding.pry
        if logged_in?
        @games = current_user.games
        erb :"/games/index"
        else 
          redirect "/login"
        end
      end 

      get "/games/new" do
        if logged_in?
        erb :"games/new" 
        else 
          redirect "/login"
        end 
        
      end 

      post "/games" do
        if logged_in? 
        @game = current_user.games.build(params)
          if @game.save 
            redirect "/games"
          else 
            redirect "/games/new"
          end 
        else 
        redirect "/login"
        end 
      end  

      get "/games/:id/edit" do
        if logged_in?
          @game = current_user.games.find_by_id(params[:id])
          if @game 
            erb :"games/edit"
          else
            redirect "/games"
          end
        else
          redirect "/login"
        end 
      end 

      patch "/games/:id" do 
      end

      get "/games/:id" do 
      end
      
      delete "/games/:id/delete" do 
      end 

      helpers do
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          @user ||= User.find(session[:user_id]) if logged_in?
        end
      end







end 