class DepartmentsController < ApplicationController
  before_action :specialty, :department, :load_categories

  def show
  end

  private
  def department
    @department ||= Department.find(params[:id])
  end
end
