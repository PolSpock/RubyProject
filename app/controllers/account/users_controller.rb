class Account::UsersController < Account::AccountController
  def index
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    redirect_to account_users_path

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
