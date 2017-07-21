require 'test_helper'

class ProductsHasChancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @products_has_chance = products_has_chances(:one)
  end

  test "should get index" do
    get products_has_chances_url
    assert_response :success
  end

  test "should get new" do
    get new_products_has_chance_url
    assert_response :success
  end

  test "should create products_has_chance" do
    assert_difference('ProductsHasChance.count') do
      post products_has_chances_url, params: { products_has_chance: { chance_id: @products_has_chance.chance_id, product_id: @products_has_chance.product_id } }
    end

    assert_redirected_to products_has_chance_url(ProductsHasChance.last)
  end

  test "should show products_has_chance" do
    get products_has_chance_url(@products_has_chance)
    assert_response :success
  end

  test "should get edit" do
    get edit_products_has_chance_url(@products_has_chance)
    assert_response :success
  end

  test "should update products_has_chance" do
    patch products_has_chance_url(@products_has_chance), params: { products_has_chance: { chance_id: @products_has_chance.chance_id, product_id: @products_has_chance.product_id } }
    assert_redirected_to products_has_chance_url(@products_has_chance)
  end

  test "should destroy products_has_chance" do
    assert_difference('ProductsHasChance.count', -1) do
      delete products_has_chance_url(@products_has_chance)
    end

    assert_redirected_to products_has_chances_url
  end
end
