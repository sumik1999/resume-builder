class RegisterController < ApplicationController

    def register
        @user = User.new
    end

    def user_params
    params.require(:register).permit(:name, :email, :password)
    end

    def create
        
            @user = User.new(user_params)
            @user.profile = Profile.new

            
            if @user.save
            
                user =  User.find_by(email: params[:register][:email].downcase)  
                log_in(user)
                redirect_to(root_path)
            else
                render('register')
            end

        
    end

end
