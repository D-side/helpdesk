class Users::TicketsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tickets = case(params[:scope])
    when 'open'
      Ticket.open
    when 'on_hold'
      Ticket.on_hold
    when 'closed'
      Ticket.closed
    else
      Ticket.unassigned
    end
  end

  def show
    @ticket = Ticket.find_by_reference!(params[:reference])
    @response = @ticket.responses.merge(current_user.responses).build
  end

  def find
    @ticket = Ticket.find_by_reference(params[:reference])
    if @ticket
      redirect_to [:users, @ticket]
    else
      flash[:notice] = 'A ticket with such reference was not found'
      redirect_to action: :index
    end
  end
end
