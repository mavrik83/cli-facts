require_relative "./data_getter"
require_relative "./console_control"
require "pry"

class CategoryList

    attr_accessor :name

    @@categories = []

    def initialize(name)
        @name = name
        @@categories << self
    end

    def self.all
        @@categories
    end

end

