class GrapesController < InheritedResources::Base

   def index
    @grapes = Grape.where(publish: '1')
   end
   def week
    @grapes = Grape.where(publish: '1',week_pub: '1')
   end
end

