require 'test_helper'

class ProofSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proof_sale = proof_sales(:one)
  end

  test "should get index" do
    get proof_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_proof_sale_url
    assert_response :success
  end

  test "should create proof_sale" do
    assert_difference('ProofSale.count') do
      post proof_sales_url, params: { proof_sale: { commentary: @proof_sale.commentary, product_id: @proof_sale.product_id, quantity: @proof_sale.quantity, sale_id: @proof_sale.sale_id, total_price: @proof_sale.total_price, user_id: @proof_sale.user_id } }
    end

    assert_redirected_to proof_sale_url(ProofSale.last)
  end

  test "should show proof_sale" do
    get proof_sale_url(@proof_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_proof_sale_url(@proof_sale)
    assert_response :success
  end

  test "should update proof_sale" do
    patch proof_sale_url(@proof_sale), params: { proof_sale: { commentary: @proof_sale.commentary, product_id: @proof_sale.product_id, quantity: @proof_sale.quantity, sale_id: @proof_sale.sale_id, total_price: @proof_sale.total_price, user_id: @proof_sale.user_id } }
    assert_redirected_to proof_sale_url(@proof_sale)
  end

  test "should destroy proof_sale" do
    assert_difference('ProofSale.count', -1) do
      delete proof_sale_url(@proof_sale)
    end

    assert_redirected_to proof_sales_url
  end
end
