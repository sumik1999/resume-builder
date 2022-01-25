class RegisterController < ApplicationController

    def register
    end

    def user_params
        params.require(:register).permit(:name, :email, :password)
    end

    def create
        
            @user = User.new(user_params)
            @user.profile = Profile.new
            @user.save

            
            if @user.save
            
                @user.profile.educations.create
                user =  User.find_by(email: params[:register][:email].downcase)
                log_in(user)

                flash[:success] = "Congratulations on successful registration!"  
                redirect_to(root_path)

            else
                if @user.errors.any?
                    @user.errors.each do |attribute, message|
                        flash[:danger] = attribute
                        flash[:danger] = message
                    end
                end
                render('register')
            end

        
    end

end
