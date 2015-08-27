class TicketMailer < ApplicationMailer
  def received_notification(ticket)
    @ticket = ticket
    mail(to: @ticket.customer_email, subject: "#{@ticket.reference}")
  end

  def response_notification(response)
    @response = response
    @ticket = @response.ticket
    mail(to: @ticket.customer_email, subject: "Reply to #{@ticket.reference}")
  end
end
