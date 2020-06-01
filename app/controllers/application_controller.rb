require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  
  get "/" do
    redirect_if_logged_in 
    erb :home
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id]) if logged_in?
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/games"
      end
    end

    def is_it_blank
      if params[:username].blank? || params[:email].blank? || params[:password].blank?
        redirect to "/signup"
      end
    end 
  end


end
