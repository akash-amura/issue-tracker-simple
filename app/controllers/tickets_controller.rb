class TicketsController < ApplicationController
  include SessionCheck
  
  def index
    @project = Project.find(params[:project_id])
    @tickets = @project.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @project = Project.find(params[:project_id])
    @ticket = Ticket.new(ticket_params) 
    @ticket.owner_id = session[:user_id]
    if @ticket.save 
      @project.tickets << @ticket
      flash[:message] = "Ticket successfully created"
      redirect_to project_ticket_path(id:@ticket.id)
    else 
      render :new
    end
  end


  def show
    @project = Project.find(params[:project_id])
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @ticket = Ticket.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else 
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @ticket = Ticket.find(params[:id])
    if @ticket.destroy 
      redirect_to project_tickets_path
    else 
      redirect_to @ticket
    end
  end

  def ticket_index
    @tickets = Ticket.all
    render 'ticket_index'
  end

  def show_projects
    @ticket = Ticket.find(params[:id])
    @projects = @ticket.projects
  end
  
  def add_projects
    @ticket = Ticket.find(params[:id])
    if request.method_symbol == :get 
      @projects = Project.all
      @projects = @projects.select{|x| !x.in?(@ticket.projects)}
      render 'add_projects'
    elsif request.method_symbol == :post
      project_ids = add_project_params
      project_ids.values[0].each do |id|
        project = Project.find(id) if !id.nil? && !id.empty?
        @ticket.projects << project if !project.nil? 
      end
      redirect_to projects_related_project_ticket_path(project_id:params[:project_id],id:@ticket.id) 
    end
  end

  private 
    
    def ticket_params
      params.require(:ticket).permit(:title,:description,:planned_completion_date,:priority,:state,:category,:blog_url)
    end

    def add_project_params
      params.require(:project).permit(project_ids:[])
    end
end
