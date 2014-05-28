class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def specialty
    id = params[:specialty_id] || params[:id]
    @specialty ||= (Specialty.where(id: id).first || Specialty.first)
  end
end
