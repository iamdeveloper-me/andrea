class FirmwareImagesController < InheritedResources::Base

  private

    def firmware_image_params
      params.require(:firmware_image).permit()
    end
end

