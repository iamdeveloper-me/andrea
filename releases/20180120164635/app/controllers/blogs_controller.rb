class BlogsController < InheritedResources::Base

	def index

		@blogs = Blog.where(publish: 't')
		
	end
end

