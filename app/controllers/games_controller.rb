class GamesController < ApplicationController 
    

      get "/games" do 
        redirect_if_not_logged_in
        @games = current_user.games
        erb :"/games/index"
      end 

      get "/games/new" do
        redirect_if_not_logged_in
        erb :"games/new" 
      end 

      post "/games" do
        redirect_if_not_logged_in
        @game = current_user.games.build(params)
        make_game
      end  

      get "/games/:id/edit" do
        if logged_in?
          set_game
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
        if logged_in?
          @game = current_user.games.find_by_id(params[:id])
          if @game
            if @game.update(title: params[:title], genre: params[:genre], platform: params[:platform])
            redirect "/games/#{@game.id}"
            else
            redirect "/games/#{@game.id}/edit"
            end
          else 
            redirect "/games"
          end
        else
          redirect "/login"
        end   
      end

      get "/games/:id" do
        if logged_in?
          @game = current_user.games.find_by_id(params[:id])
          if @game 
            erb :'/games/show'
          else
            redirect "/games"
          end
        else
          redirect "/login"
        end 
      end
      
      delete "/games/:id" do 
        if logged_in?
          set_game
          if @game 
            @game.delete
            redirect "/games"
          end 
        else
          redirect "/login"
        end    
      end 
      
    private
    def set_game
      @game = current_user.games.find_by_id(params[:id])
    end

    def make_game
      if @game.save 
        redirect "/games"
      else 
        redirect "/games/new"
      end    
    end 
end 