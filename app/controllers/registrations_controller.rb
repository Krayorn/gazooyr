class RegistrationsController < Devise::RegistrationsController
    private
    def registration_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)      
    end

end
