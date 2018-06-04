class CreateFirmwareImages < ActiveRecord::Migration[5.0]
  def change
        create_table :firmware_images do |t|
          t.string :firmware_image_filename
          t.binary :firmware_image, :limit => 10.megabyte

          t.timestamps
        end
      end
end
