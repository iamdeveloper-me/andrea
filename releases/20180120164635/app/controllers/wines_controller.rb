class WinesController < InheritedResources::Base

	def index

		@wines = Wine.where(publish: 't')
		
	end

	def week

		@wines = Wine.where(publish: 't',week_pub: 't')

	end

end

