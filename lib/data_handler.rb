require_relative "./data_getter"
require_relative "./console_control"
require "pry"

class DataHandler

    attr_accessor :categories


    def self.fact_parser(category)
        response = DataGetter.choose_category(category)
        response["value"]
    end

    def self.category_lister
        @categories = DataGetter.get_categories
        @categories = @categories.map.with_index do |cat, idx|
            "#{idx + 1}: #{cat}"
        end
        @categories
    end


    

    


end