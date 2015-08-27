class TicketMailer < ApplicationMailer
  def received_notification(ticket)
    @ticket = ticket
    mail(to: ticket.customer_email, subject: "#{ticket.reference}")
  end
end
