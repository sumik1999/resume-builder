class PublicshowController < ApplicationController

    def share
        @user = User.find(params[:id])
        render('share')
    end
end