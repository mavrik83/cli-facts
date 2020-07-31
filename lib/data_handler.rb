require_relative "./data_getter"
require_relative "./console_control"
require "pry"

class DataHandler

    attr_accessor :categories

    def initialize
        @categories = []
    end

    def self.fact_parser(category)
        response = DataGetter.choose_category(category)
        response["value"]
    end

    def self.category_pull
        DataGetter.get_categories
    end

    def self.category_lister
        @categories = self.category_pull
        @categories = @categories.map.with_index do |cat, idx|
            "#{idx + 1}: #{cat}"
        end
        @categories
    end


    

    


end