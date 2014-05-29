class ProvidersController < ApplicationController
  before_action :specialty, :provider, :load_categories

  def show
  end

  private
  def provider
    @provider ||= Provider.find(params[:id])
  end
end
