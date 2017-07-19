require 'test_helper'

class PromotionHasProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion_has_product = promotion_has_products(:one)
  end

  test "should get index" do
    get promotion_has_products_url
    assert_response :success
  end

  test "should get new" do
    get new_promotion_has_product_url
    assert_response :success
  end

  test "should create promotion_has_product" do
    assert_difference('PromotionHasProduct.count') do
      post promotion_has_products_url, params: { promotion_has_product: { product_id: @promotion_has_product.product_id, promotion_id: @promotion_has_product.promotion_id } }
    end

    assert_redirected_to promotion_has_product_url(PromotionHasProduct.last)
  end

  test "should show promotion_has_product" do
    get promotion_has_product_url(@promotion_has_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_promotion_has_product_url(@promotion_has_product)
    assert_response :success
  end

  test "should update promotion_has_product" do
    patch promotion_has_product_url(@promotion_has_product), params: { promotion_has_product: { product_id: @promotion_has_product.product_id, promotion_id: @promotion_has_product.promotion_id } }
    assert_redirected_to promotion_has_product_url(@promotion_has_product)
  end

  test "should destroy promotion_has_product" do
    assert_difference('PromotionHasProduct.count', -1) do
      delete promotion_has_product_url(@promotion_has_product)
    end

    assert_redirected_to promotion_has_products_url
  end
end
