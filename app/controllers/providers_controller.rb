class ProvidersController < ApplicationController
  before_action :specialty

  def show
    provider
  end

  private
  def provider
    @provider ||= Provider.find(params[:id])
  end
end
