require 'test_helper'

class Users::TicketsControllerTest < ActionController::TestCase
  setup do
    @ticket = Ticket.create(TicketTest::VALID_SAMPLE)
  end

  test "should reject guests" do
    get :index
    assert_redirected_to new_user_session_path
    get :show, reference: @ticket.reference
    assert_redirected_to new_user_session_path
  end
end
