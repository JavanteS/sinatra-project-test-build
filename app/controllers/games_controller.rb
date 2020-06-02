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
      redirect_if_not_logged_in
      game_exist 
      erb :"games/edit"    
    end 

    patch "/games/:id" do
      redirect_if_not_logged_in
      game_exist
      if @game.update(title: params[:title], genre: params[:genre], platform: params[:platform])
        redirect "/games/#{@game.id}"
      else
        redirect "/games/#{@game.id}/edit"
      end
    end

    get "/games/:id" do
      redirect_if_not_logged_in
      game_exist
      erb :'/games/show'
    end
      
    delete "/games/:id" do 
      redirect_if_not_logged_in
      set_game
      if @game 
        @game.delete
        redirect "/games"
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
    
    def game_exist
      set_game
      if @game == nil 
        redirect "/games"
      end 
    end 
end 