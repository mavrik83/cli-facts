class API

    # Returns an array of categories from the API.
    def self.get_categories
        HTTParty.get("https://api.chucknorris.io/jokes/categories")
    end

    # Returns a JSON object that contains a random joke based on the passed in category.
    def self.choose_category(category)
        HTTParty.get("https://api.chucknorris.io/jokes/random?category=#{category}")
    end
    
end

