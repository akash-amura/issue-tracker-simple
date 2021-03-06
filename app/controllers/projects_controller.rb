class ProjectsController < ApplicationController
  include SessionCheck

  around_action :session_action

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save 
      redirect_to @project
    else 
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else 
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path
    else 
      render :show
    end
  end

  private 
    
    def project_params
      params.require(:project).permit(:title,:description,:planned_completion_date,:manager_id,:creator_id)
    end


end
