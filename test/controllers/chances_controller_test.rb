require 'test_helper'

class ChancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chance = chances(:one)
  end

  test "should get index" do
    get chances_url
    assert_response :success
  end

  test "should get new" do
    get new_chance_url
    assert_response :success
  end

  test "should create chance" do
    assert_difference('Chance.count') do
      post chances_url, params: { chance: { name: @chance.name, products_id: @chance.products_id } }
    end

    assert_redirected_to chance_url(Chance.last)
  end

  test "should show chance" do
    get chance_url(@chance)
    assert_response :success
  end

  test "should get edit" do
    get edit_chance_url(@chance)
    assert_response :success
  end

  test "should update chance" do
    patch chance_url(@chance), params: { chance: { name: @chance.name, products_id: @chance.products_id } }
    assert_redirected_to chance_url(@chance)
  end

  test "should destroy chance" do
    assert_difference('Chance.count', -1) do
      delete chance_url(@chance)
    end

    assert_redirected_to chances_url
  end
end
