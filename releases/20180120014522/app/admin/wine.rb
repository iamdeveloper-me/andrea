ActiveAdmin.register Wine do
  # everything happens here :D
  permit_params :wine, :name, :short_des, :long_des, :pic, :regions, :publish, :share, :like, :week_pub, :supply, :supply_url
  index do
  	column :id
  	column :name
  	column :pic
  	column :regions
  	column :publish
  	column :week_pub
  	column :updated_at
    column :supply
  	actions
  end
  form do |f|
  	f.inputs "wine" do
  		f.input :name, as: :string
  		f.input :short_des, as: :string
  		f.input :long_des, as: :text
  		f.input :pic, as: :file
      f.input :supply, input_html:{data:{role:'tagsinput'}}
      f.input :supply_url, input_html:{data:{role:'tagsinput'}}
      f.input :regions, input_html:{data:{role:'tagsinput'}} 
  		f.input :publish, as: :boolean
  		f.input :week_pub, as: :boolean
  	end
  	f.actions
  end
  controller do

  	def create
  		attrs = permitted_params[:wine]

  		@wine = Wine.create()
  		@wine[:name] = attrs[:name]
  		@wine[:short_des] = attrs[:short_des]
  		@wine[:long_des] = attrs[:long_des]
      @wine[:supply] = attrs[:supply]
      @wine[:supply_url] = attrs[:supply_url]
  		@wine[:publish] = attrs[:publish]
  		@wine[:regions] = attrs[:regions]
  		@wine[:week_pub] = attrs[:week_pub]
      unless attrs[:pic] == nil
      @wine[:pic] = attrs[:pic].original_filename
  		tmp = attrs[:pic].tempfile
  		file = Rails.root.join('public', 'uploads', attrs[:pic].original_filename)
  		FileUtils.cp tmp.path, file
      File.chmod(0777,"public/uploads/#{@wine[:pic]}")
      end
  		if @wine.save
  			redirect_to admin_wine_path(@wine)
  		else
  			render :new
  		end
  	end
  	def update
  		attrs = permitted_params[:wine]

  		@wine = Wine.where(id: params[:id]).first!
  		@wine[:name] = attrs[:name]
  		@wine[:short_des] = attrs[:short_des]
  		@wine[:long_des] = attrs[:long_des]
      @wine[:supply] = attrs[:supply]
      @wine[:supply_url] = attrs[:supply_url]
  		@wine[:publish] = attrs[:publish]
  		@wine[:regions] = attrs[:regions]
  		@wine[:week_pub] = attrs[:week_pub]
      unless attrs[:pic] == nil
  		@wine[:pic] = attrs[:pic].original_filename
  		tmp = attrs[:pic].tempfile
  		file = Rails.root.join('public', 'uploads', attrs[:pic].original_filename)
  		FileUtils.cp tmp.path, file
      File.chmod(0777,"public/uploads/#{@wine[:pic]}")
      end
  		if @wine.save
  			redirect_to admin_wine_path(@wine)
  		else
  			render :new
  		end
  	end
  end
end
