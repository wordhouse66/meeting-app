require "test_helper"

class DateRangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_range = date_ranges(:one)
  end

  test "should get index" do
    get date_ranges_url
    assert_response :success
  end

  test "should get new" do
    get new_date_range_url
    assert_response :success
  end

  test "should create date_range" do
    assert_difference("DateRange.count") do
      post date_ranges_url, params: { date_range: { finish: @date_range.finish, start: @date_range.start } }
    end

    assert_redirected_to date_range_url(DateRange.last)
  end

  test "should show date_range" do
    get date_range_url(@date_range)
    assert_response :success
  end

  test "should get edit" do
    get edit_date_range_url(@date_range)
    assert_response :success
  end

  test "should update date_range" do
    patch date_range_url(@date_range), params: { date_range: { finish: @date_range.finish, start: @date_range.start } }
    assert_redirected_to date_range_url(@date_range)
  end

  test "should destroy date_range" do
    assert_difference("DateRange.count", -1) do
      delete date_range_url(@date_range)
    end

    assert_redirected_to date_ranges_url
  end
end
