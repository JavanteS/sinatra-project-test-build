require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    if logged_in?
      redirect "/games"
    end 
    erb :home
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
