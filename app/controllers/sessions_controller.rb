class SessionsController < ApplicationController
    def new
    end

    def create
        binding.pry
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        else
            render :new
        end
    end
    
    def destroy
    end
end
