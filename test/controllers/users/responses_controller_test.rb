require 'test_helper'

class Users::ResponsesControllerTest < ActionController::TestCase
  test "should reject guests" do
    get :edit
    assert_redirected_to new_user_session_path
  end

end
