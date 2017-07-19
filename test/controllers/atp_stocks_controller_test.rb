require 'test_helper'

class AtpStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atp_stock = atp_stocks(:one)
  end

  test "should get index" do
    get atp_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_atp_stock_url
    assert_response :success
  end

  test "should create atp_stock" do
    assert_difference('AtpStock.count') do
      post atp_stocks_url, params: { atp_stock: { max_stock: @atp_stock.max_stock, min_stock: @atp_stock.min_stock, product_id: @atp_stock.product_id } }
    end

    assert_redirected_to atp_stock_url(AtpStock.last)
  end

  test "should show atp_stock" do
    get atp_stock_url(@atp_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_atp_stock_url(@atp_stock)
    assert_response :success
  end

  test "should update atp_stock" do
    patch atp_stock_url(@atp_stock), params: { atp_stock: { max_stock: @atp_stock.max_stock, min_stock: @atp_stock.min_stock, product_id: @atp_stock.product_id } }
    assert_redirected_to atp_stock_url(@atp_stock)
  end

  test "should destroy atp_stock" do
    assert_difference('AtpStock.count', -1) do
      delete atp_stock_url(@atp_stock)
    end

    assert_redirected_to atp_stocks_url
  end
end
