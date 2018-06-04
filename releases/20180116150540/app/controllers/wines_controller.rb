class WinesController < InheritedResources::Base

	def index

		@wines = Wine.where(publish: '1')
		
	end

	def week

		@wines = Wine.where(publish: '1',week_pub: '1')

	end

end

