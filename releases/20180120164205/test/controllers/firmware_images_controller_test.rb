require 'test_helper'

class FirmwareImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @firmware_image = firmware_images(:one)
  end

  test "should get index" do
    get firmware_images_url
    assert_response :success
  end

  test "should get new" do
    get new_firmware_image_url
    assert_response :success
  end

  test "should create firmware_image" do
    assert_difference('FirmwareImage.count') do
      post firmware_images_url, params: { firmware_image: {  } }
    end

    assert_redirected_to firmware_image_url(FirmwareImage.last)
  end

  test "should show firmware_image" do
    get firmware_image_url(@firmware_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_firmware_image_url(@firmware_image)
    assert_response :success
  end

  test "should update firmware_image" do
    patch firmware_image_url(@firmware_image), params: { firmware_image: {  } }
    assert_redirected_to firmware_image_url(@firmware_image)
  end

  test "should destroy firmware_image" do
    assert_difference('FirmwareImage.count', -1) do
      delete firmware_image_url(@firmware_image)
    end

    assert_redirected_to firmware_images_url
  end
end
