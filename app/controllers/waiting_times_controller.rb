class WaitingTimesController < InheritedResources::Base
  before_filter :require_login
  before_action :specialty, :provider

  def create
    create! do |success, failure|
      success.html { redirect_to specialty_provider_path(@specialty, @provider), notice: 'Gracias por tu Opinión!' }
      failure.html { render action: :new and return }
    end
  end

  private
  def provider
    @provider = Provider.find(params[:provider_id])
  end

  def resource_params
    params.permit(:when, :waiting, :specialty_id, :provider_id)
  end
end
