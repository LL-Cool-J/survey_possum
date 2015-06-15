require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  test "knows answers by submission" do
    @question = questions(:one)
    @answer = answers(:one)
    @answer_three = answers(:three)
    @submission = submissions(:one)
    @submission_two = submissions(:two)
    assert_equal [@answer], @question.answers_by_submission(@submission.id)
    assert_equal [@answer_three], @question.answers_by_submission(@submission_two.id)
  end
end
