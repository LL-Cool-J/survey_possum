require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  setup do
    @survey = surveys(:one)
    @author = authors(:one)
    session[:author_id] = @author.id
    @question = questions(:one)
    @new_survey = Survey.create(author_id: @author.id, title: "Title!", published: false)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post :create, survey: { author_id: @author.id, description: @survey.description,
          title: @survey.title, published: false}
    end

    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should create survey with questions" do
    assert_difference('Question.count') do
      post :create, survey: { author_id: @author.id, description: @survey.description,
          title: @survey.title, published: false, questions_attributes:
          [question_text: @question.question_text, question_info: @question.question_info,
          question_type: @question.question_type, required: false, order_number: 1] }
    end

    assert_redirected_to survey_path(assigns(:survey))
  end


  test "should show survey" do
    get :show, id: @survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_survey
    assert_response :success
  end

  test "should update survey and questions" do
    patch :update, id: @survey, survey: { author_id: @author.id, description: @survey.description,
        title: @survey.title, published: true,  questions_attributes:
        [question_text: @question.question_text, question_info: @question.question_info,
        question_type: @question.question_type, required: false, order_number: 1]}
    assert_redirected_to survey_path(assigns(:survey))
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete :destroy, id: @survey
    end

    assert_redirected_to surveys_path
  end
end
