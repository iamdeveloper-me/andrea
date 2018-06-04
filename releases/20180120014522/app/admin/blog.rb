ActiveAdmin.register Blog do
  # everything happens here :D
  permit_params :blog, :title, :des, :picture , :tags, :publish

  config.filters = false

  index do

  	column :id
  	column :title
  	column :des
  	column :pic
  	column :publish
  	column :tags
  	column :updated_at
  	actions
  end

  form do |f|
  	f.inputs "blog" do
  		f.input :title, as: :string
  		f.input :des, as: :text
  		f.input :picture, as: :file
  		f.input :publish, as: :boolean
  		f.input :tags, as: :string
  	end
  	f.actions
  end

  show do
  	attributes_table do
  		row :title
  		row :pic
  		row :des
  		row :tags
  		row :publish
  	end
  end

  controller do

  	def create
  		attrs = permitted_params[:blog]

  		@blog = Blog.create()
  		@blog[:title] = attrs[:title]
  		@blog[:des] = attrs[:des]
  		@blog[:tags] = attrs[:tags]
  		@blog[:publish] = attrs[:publish]
      unless attrs[:picture] == nil
  		@blog[:pic] = attrs[:picture].original_filename
  		tmp = attrs[:picture].tempfile
  		file = Rails.root.join('public','uploads', attrs[:picture].original_filename)
  		FileUtils.cp tmp.path, file
      File.chmod(0777,"public/uploads/#{@blog[:pic]}")
      end
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


      if @blog.save
      	redirect_to admin_blog_path(@blog)
      else
      	render :new
      end
  end

  def update
  	attrs = permitted_params[:blog]

  	@blog = Blog.where(id: params[:id]).first!
  	@blog[:title] = attrs[:title]
  	@blog[:des] = attrs[:des]
  	@blog[:tags] = attrs[:tags]
    @blog[:publish] = attrs[:publish]
     unless attrs[:picture] == nil
    @blog[:pic] = attrs[:picture].original_filename
  	tmp = attrs[:picture].tempfile
  	file = Rails.root.join('public','uploads', attrs[:picture].original_filename)
  	FileUtils.cp tmp.path, file
    File.chmod(0777,"public/uploads/#{@blog[:pic]}")
    end
  	if @blog.save
  		redirect_to admin_blog_path(@blog)
  	else
  		render :edit
  	end
  end
end
end
