require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  REFERENCE_FORMAT = /\ATicket-[A-Z]{3}-[0-9]{3}-[A-Z]{3}-[0-9]{3}-[A-Z]{3}\z/
  VALID_SAMPLE = {
    customer_name: 'Foo',
    customer_email: 'foo@example.com',
    subject: "It's not working!",
    body: "I did nothing! It just doesn't work!"
  }

  test 'rejection of incomplete tickets' do
    refute Ticket.new.valid?
  end

  test "ticket's initial state" do
    ticket = Ticket.create(VALID_SAMPLE)
    assert(ticket.persisted?, 'should be saved successfully')
    assert(ticket.state == 'waiting_for_staff')
    assert(ticket.reference =~ REFERENCE_FORMAT)
  end
end
