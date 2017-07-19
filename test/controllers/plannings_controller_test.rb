require 'test_helper'

class PlanningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planning = plannings(:one)
  end

  test "should get index" do
    get plannings_url
    assert_response :success
  end

  test "should get new" do
    get new_planning_url
    assert_response :success
  end

  test "should create planning" do
    assert_difference('Planning.count') do
      post plannings_url, params: { planning: { final_date: @planning.final_date, flag: @planning.flag, planning_date: @planning.planning_date, prodiver_id: @planning.prodiver_id, product_id: @planning.product_id, quantity: @planning.quantity } }
    end

    assert_redirected_to planning_url(Planning.last)
  end

  test "should show planning" do
    get planning_url(@planning)
    assert_response :success
  end

  test "should get edit" do
    get edit_planning_url(@planning)
    assert_response :success
  end

  test "should update planning" do
    patch planning_url(@planning), params: { planning: { final_date: @planning.final_date, flag: @planning.flag, planning_date: @planning.planning_date, prodiver_id: @planning.prodiver_id, product_id: @planning.product_id, quantity: @planning.quantity } }
    assert_redirected_to planning_url(@planning)
  end

  test "should destroy planning" do
    assert_difference('Planning.count', -1) do
      delete planning_url(@planning)
    end

    assert_redirected_to plannings_url
  end
end
