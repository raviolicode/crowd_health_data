class SearchController < ApplicationController
  def category
    categories = params[:category]
    @specialty = Specialty.find(categories["specialty_id"])
    @department = Department.find_by_id(categories["department_id"])
    @provider = Provider.find_by_id(categories["provider_id"])

    destination_path = specialty_provider_path(@specialty, @provider) if @provider
    destination_path = specialty_provider_path(@specialty, @provider) if @provider
    destination_path = specialty_department_path(@specialty, @department) if @department

    redirect_to destination_path
  end
end
