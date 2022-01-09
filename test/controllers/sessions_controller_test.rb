require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    admin1 = users(:one)
    post login_url, params: { name: admin1.name, password: 'password' }
    assert_redirected_to home_url
    assert_equal admin1.id, session[:user_id]
  end

  test "should fail login" do
    admin1 = users(:one)
    post login_url, params: { name: admin1.name, password: 'wrong' } 
    assert_redirected_to login_url
  end

  test "should logout" do
    delete logout_url 
    assert_redirected_to login_url
  end
end
