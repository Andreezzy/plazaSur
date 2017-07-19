require 'test_helper'

class AtpImpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atp_impost = atp_imposts(:one)
  end

  test "should get index" do
    get atp_imposts_url
    assert_response :success
  end

  test "should get new" do
    get new_atp_impost_url
    assert_response :success
  end

  test "should create atp_impost" do
    assert_difference('AtpImpost.count') do
      post atp_imposts_url, params: { atp_impost: { impost: @atp_impost.impost, product_id: @atp_impost.product_id } }
    end

    assert_redirected_to atp_impost_url(AtpImpost.last)
  end

  test "should show atp_impost" do
    get atp_impost_url(@atp_impost)
    assert_response :success
  end

  test "should get edit" do
    get edit_atp_impost_url(@atp_impost)
    assert_response :success
  end

  test "should update atp_impost" do
    patch atp_impost_url(@atp_impost), params: { atp_impost: { impost: @atp_impost.impost, product_id: @atp_impost.product_id } }
    assert_redirected_to atp_impost_url(@atp_impost)
  end

  test "should destroy atp_impost" do
    assert_difference('AtpImpost.count', -1) do
      delete atp_impost_url(@atp_impost)
    end

    assert_redirected_to atp_imposts_url
  end
end
