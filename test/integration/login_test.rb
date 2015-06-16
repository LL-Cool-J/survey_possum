require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "can login and logout" do
    get login_path
    assert_select "input[type=password]", 1
    post login_path, email: "lee@allen.com", password: "password"
    assert_redirected_to root_path
    follow_redirect!
    assert response.body.match "Login Successful."
    get logout_path
    follow_redirect!
    assert response.body.match "Logout Successful."
  end

  test "can signup for survey possum" do
    get signup_path
    follow_redirect!
    assert response.body.match "Sign Up For SurveyPossum"
    assert_select "input[type=password]", 2
    post authors_path, author: { first_name: "Joe", last_name: "Reiff", email: "joe@reiff.com",
        password: "password", password_confirmation: "password" }
    assert_redirected_to root_path
    follow_redirect!
    assert response.body.match "Welcome to SurveyPossum, Joe!"
    get surveys_path
    assert_response :success
    assert response.body.match "You haven't created any surveys yet!"
    get logout_path
    follow_redirect!
    assert response.body.match "Logout Successful."
  end

end
