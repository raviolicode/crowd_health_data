class SearchController < ApplicationController
  def category
    redirect_to destination_path(params[:category])
  end

  private

  def destination_path(categories)
    @specialty = Specialty.find(categories["specialty_id"])
    @department = Department.find_by_id(categories["department_id"])
    @provider = Provider.find_by_id(categories["provider_id"])

    if @provider
      destination_path = specialty_provider_path(@specialty, @provider)
    elsif @department
      destination_path = specialty_department_path(@specialty, @department)
    else
      destination_path = specialty_path(@specialty)
    end
  end
end
