require_relative "./console_control"
require_relative "./data_handler"
require 'pry'
require "httparty"

class DataGetter

    def self.get_categories
        HTTParty.get("https://api.chucknorris.io/jokes/categories")
    end

    def self.choose_category(category)
        HTTParty.get("https://api.chucknorris.io/jokes/random?category=#{category}")
    end


end

