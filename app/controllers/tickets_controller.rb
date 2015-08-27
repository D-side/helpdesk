class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.create(ticket_params)
  rescue ActiveRecord::RecordNotUnique
    # NOTE: Unique reference generation is subject to race conditions.
    #       Chances of getting here are ASTRONOMICALLY low, but non-zero.
    # FIXME: Ticket IDs are fixed-length, if id space gets exhausted this will
    #        become an infinite loop.
    #        A possible fix if to limit number of attempts and then what?
    #        Suggest telling via helpdesk that... helpdesk is broken? Huh?
    retry
  end

  def show
    @ticket = Ticket.find_by_reference(params[:reference])
  end

  private

  def ticket_params
    params.require(:ticket).permit(
      :customer_name, :customer_email, :subject, :body
    )
  end
end
