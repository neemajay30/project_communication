class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[edit update show destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.current_user = current_user
    if @project.save
      redirect_to project_path(@project), notice: "Project created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Project updated successfully!"
    else
      render :new
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project deleted successfully!"
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    @project.current_user = current_user
  end

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end
