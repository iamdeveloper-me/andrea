# grape controller
class GrapesController < InheritedResources::Base

   def index
    @grapes = Grape.where(publish: 't')
   end
   def week
    @grapes = Grape.where(publish: 't',week_pub: 't')
   end
end

