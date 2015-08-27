require 'test_helper'

class TicketsControllerTest < ActionController::TestCase
  test "new ticket form" do
    get :new
    assert_response :success
  end

  test "should submit a ticket" do
    post :create, ticket: TicketTest::VALID_SAMPLE
  end

  test "should get show" do
    @ticket = Ticket.create(TicketTest::VALID_SAMPLE)
    get :show, reference: @ticket.reference
    assert_response :success
  end
end
