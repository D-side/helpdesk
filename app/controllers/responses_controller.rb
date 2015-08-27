class ResponsesController < ApplicationController
  def create
    @ticket = Ticket.find_by_reference!(params[:ticket_reference])
    @response = @ticket.responses.build(response_params)
    if @response.save
      redirect_to @ticket
    else
      render 'tickets/show'
    end
  end

  private

  def response_params
    params.require(:response).permit(:body)
  end
end
