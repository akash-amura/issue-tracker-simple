class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
  end

  def create
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    
    def ticket_params
      params.require(:ticket).permit(:title,:description,:planned_completion_date,:actual_completion_date,:priority,:state,:category,:blog_url)
    end
end
