class BlogsController < InheritedResources::Base

	def index

		@blogs = Blog.where(publish: '1')
		
	end
end

