require 'test_helper'

class InsuranceDetailsControllerTest < ActionController::TestCase
  setup do
    @insurance_detail = insurance_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_detail" do
    assert_difference('InsuranceDetail.count') do
      post :create, insurance_detail: { claimdate: @insurance_detail.claimdate, dateofpenalty: @insurance_detail.dateofpenalty, freeclaim: @insurance_detail.freeclaim, homeowner: @insurance_detail.homeowner, kmperyear: @insurance_detail.kmperyear, licenseheld: @insurance_detail.licenseheld, licensenumber: @insurance_detail.licensenumber, packing: @insurance_detail.packing, penaltypoint: @insurance_detail.penaltypoint, recentclaim: @insurance_detail.recentclaim, user_id: @insurance_detail.user_id, yearsdriving: @insurance_detail.yearsdriving }
    end

    assert_redirected_to insurance_detail_path(assigns(:insurance_detail))
  end

  test "should show insurance_detail" do
    get :show, id: @insurance_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance_detail
    assert_response :success
  end

  test "should update insurance_detail" do
    patch :update, id: @insurance_detail, insurance_detail: { claimdate: @insurance_detail.claimdate, dateofpenalty: @insurance_detail.dateofpenalty, freeclaim: @insurance_detail.freeclaim, homeowner: @insurance_detail.homeowner, kmperyear: @insurance_detail.kmperyear, licenseheld: @insurance_detail.licenseheld, licensenumber: @insurance_detail.licensenumber, packing: @insurance_detail.packing, penaltypoint: @insurance_detail.penaltypoint, recentclaim: @insurance_detail.recentclaim, user_id: @insurance_detail.user_id, yearsdriving: @insurance_detail.yearsdriving }
    assert_redirected_to insurance_detail_path(assigns(:insurance_detail))
  end

  test "should destroy insurance_detail" do
    assert_difference('InsuranceDetail.count', -1) do
      delete :destroy, id: @insurance_detail
    end

    assert_redirected_to insurance_details_path
  end
end
