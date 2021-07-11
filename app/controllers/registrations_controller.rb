class RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end
end