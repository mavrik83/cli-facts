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
        if DataHandler.category_pull.include?(response)
            fact = DataHandler.fact_parser(response)
            puts "\n\n"
            puts fact 
        else
            puts "That isn't one of the categories!"
        end

        exit_or_rerun
        
    end

    def exit_or_rerun
        puts "\n\nDo you want to select another category?\n"
        print "yes/no? :=> "
        response = gets.chomp
        if response.downcase == "yes" 
            select_category
        elsif response.downcase == "no"
            exit!
        else
            puts "Invalid response! Please enter 'yes' or 'no'!"
            exit_or_rerun
        end
    end

    

    

end