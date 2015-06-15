require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "knows which questions are required" do
    @survey = surveys(:one)
    @survey_two = surveys(:two)
    @question = questions(:three)
    @question_four = questions(:four)

    assert_equal [@question, @question_four], @survey.required_questions
    assert_equal [], @survey_two.required_questions
  end

  test "knows if it has questions" do
    @survey = surveys(:one)
    @new_survey = Survey.create!(title: @survey.title, author: authors(:one))

    assert_equal true, @survey.check_if_questions?
    assert_equal false, @new_survey.check_if_questions?
  end
end
