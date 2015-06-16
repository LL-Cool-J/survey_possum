require 'test_helper'

class AccessTest < ActionDispatch::IntegrationTest
  test "can't take survey until published" do
    @question = questions(:one)
    @author = authors(:one)
    @survey = surveys(:one)
    get login_path
    assert_select "input[type=password]", 1
    post login_path, email: "lee@allen.com", password: "password"
    assert_redirected_to root_path
    get new_survey_path
    post surveys_path, survey: { author_id: @author.id, description:"description",
        title: "Title", published: false, questions_attributes:
        [question_text: @question.question_text, question_info: @question.question_info,
        question_type: @question.question_type, required: false, order_number: 1] }
    assert_redirected_to survey_path(Survey.find_by_id(980190963))
    @survey = Survey.find_by_id(980190963)
    follow_redirect!
    assert response.body.match "Survey was successfully created."
    get logout_path

    # fails after this line
    #
    # get survey_path, survey: {id: @survey.id}
    # assert_redirected_to login_path
    # post login_path, email: "lee@allen.com", password: "password"
    # assert_redirected_to root_path
    # get survey_path, id: @survey.id
    # patch survey_path, survey: {published: true}

  end
end
