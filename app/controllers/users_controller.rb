class UsersController < InheritedResources::Base
  def create
    create! do |success, failure|
      success.html { redirect_back_or_to(:providers, notice: 'Registration successful') }
      failure.html { render action: :new and return }
    end
  end

  private

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
