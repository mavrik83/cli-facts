class Category < ActiveRecord::Base

    # # Getter and setter methods. 
    # attr_accessor :name

    # # Collection of all instance of categories. i.e. each named category is an object and is collected here.
    # @@categories = []

    # # Instantiates a new category object and pushed it into the @@categories variable.
    # def initialize(name)
    #     @name = name
    #     @@categories << self
    # end

    # # All method to give outside access to the class variable @@categories.
    # def self.all
    #     @@categories
    # end

end

