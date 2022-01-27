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
            
                @education = @user.profile.educations.create
                @experience = @user.profile.experiences.create
                user =  User.find_by(email: params[:register][:email].downcase)
                log_in(user)

                flash[:success] = "Congratulations on successful registration!"  
                redirect_to(root_path)

            else
                if @user.errors.any?
                    @user.errors.each do |attribute, message|
                        flash[:danger] = "#{attribute} "+message
                    end
                end
                render('register')
            end

        
    end

end
