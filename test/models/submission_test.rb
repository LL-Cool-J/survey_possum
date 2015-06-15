require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test "knows if required questions have been answered" do
    @survey = surveys(:one)
    @submission_one = submissions(:one)
    @submission_two = submissions(:two)

    assert_equal true, @submission_one.check_required?
    assert_equal false, @submission_two.check_required?
  end
end
