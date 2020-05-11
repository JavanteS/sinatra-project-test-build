class UsersController < ApplicationController 

    configure do
        enable :sessions
        set :session_secret, "secret"
      end


end