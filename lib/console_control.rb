require_relative "./data_getter"
require_relative "./data_handler"

class ConsoleControl

    # def initialize(name)
    #     @name = name
    # end

    def run
        puts "Welcome to Chuck Norris facts!\n\n"
        self.select_category
    end

    def select_category
        puts "Please select from the following catagories:"
        puts DataGetter.get_categories
        self.display_fact
    end

    def display_fact
        response = gets.chomp
        fact = DataHandler.fact_parser(response)
        puts fact
    end

end