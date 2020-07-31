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
        puts "Please select from the following catagories:\n\n"
        
        puts DataHandler.category_lister
        puts "\n\n"
    
        self.display_fact
    end

    def display_fact
        print ":=> "
        response = gets.chomp
        if response

        end
        fact = DataHandler.fact_parser(response)
        puts "\n\n"
        puts fact 
    end

    # def exit_or_rerun
    #     ""
    #     response = gets.chomp
    #     if respons 
    # end

    

    

end