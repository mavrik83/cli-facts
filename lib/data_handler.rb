require_relative "./data_getter"
require_relative "./console_control"
require "pry"

class CategoryList

    attr_accessor :categories, :list

    @@categories = []

    def initialize
        list = DataGetter.get_categories
        list.each do |cat|
            @@categories << cat
        end
        
    end


    


    

    


end