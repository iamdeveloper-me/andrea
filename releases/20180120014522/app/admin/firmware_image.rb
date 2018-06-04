ActiveAdmin.register FirmwareImage do
  # everything happens here :D
  permit_params :firmware_image

  config.filters = false

  index do
    column :firmware_image_filename
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Firmware" do
      f.input :firmware_image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :firmware_image_filename
    end
  end

  controller do

    def create
      attrs = permitted_params[:firmware_image]

      @firmware_image = FirmwareImage.create()

      @firmware_image[:firmware_image_filename] = attrs[:firmware_image].original_filename
      @firmware_image[:firmware_image] = attrs[:firmware_image].read

      tmp = attrs[:firmware_image].tempfile
      file = File.join("public/uploads", attrs[:firmware_image].original_filename)
      FileUtils.cp tmp.path, file
    #   def self.save_file(upload)   

    # file_name = upload['datafile'].original_filename  if  (upload['datafile'] !='')    
    # file = upload['datafile'].read    

    # file_type = file_name.split('.').last
    # new_name_file = Time.now.to_i
    # name_folder = new_name_file
    # new_file_name_with_type = "#{new_name_file}." + file_type

    # image_root = "#{RAILS_CAR_IMAGES}"


    # Dir.mkdir(image_root + "#{name_folder}");
    #   File.open(image_root + "#{name_folder}/" + new_file_name_with_type, "wb")  do |f|  
    #     f.write(file) 
      # end


      if @firmware_image.save
        redirect_to admin_firmware_image_path(@firmware_image)
      else
        render :new
      end
    end

    def update
      attrs = permitted_params[:firmware_image]

      @firmware_image = FirmwareImage.where(id: params[:id]).first!

      @firmware_image[:firmware_image_filename] = attrs[:firmware_image].original_filename
      @firmware_image[:firmware_image] = attrs[:firmware_image].read

      if @firmware_image.save
        redirect_to admin_firmware_image_path(@firmware_image)
      else
        render :edit
      end
    end
  end
end
