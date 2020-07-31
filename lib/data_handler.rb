class Category

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


