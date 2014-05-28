class DepartmentsController < ApplicationController
  before_action :specialty

  def show
    department
  end

  private
  def department
    @department ||= Department.find(params[:id])
  end
end
