require_relative "./data_getter"
require_relative "./console_control"
require "pry"

class DataHandler


    def self.fact_parser(category)
        response = DataGetter.choose_category(category)
        response["value"]
    end

    

    


end