require_relative "./data_getter"
require_relative "./data_handler"

class ConsoleControl

    

    def run
        puts "Welcome to Chuck Norris facts!\n\n"
        CategoryList.new
        select_category
    end

    

    def select_category
        puts "Please select from the following catagories:\n\n"
        puts "\n\n"
        puts self.category_lister
        display_fact
    end

    def self.category_lister
        idx_categories = CategoryList.categories do |cat, idx|
            "#{idx + 1}: #{cat}"
        end
        idx_categories
    end

    def self.fact_parser(category)
        response = DataGetter.choose_category(category)
        response["value"]
    end

    def display_fact
        print ":=> "
        response = gets.chomp
        if @list.include?(response)
            fact = self.fact_parser(response)
            puts "\n\n"
            puts fact 
        else
            puts "That isn't one of the categories!"
        end

        self.exit_or_rerun
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