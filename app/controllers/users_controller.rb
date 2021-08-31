class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def suspended
    end

    def show
    end
end
