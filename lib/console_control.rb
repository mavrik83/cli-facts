require_relative "./data_getter"
require_relative "./data_handler"

class ConsoleControl

    

    def run
        puts "Welcome to Chuck Norris facts!\n\n"
        list = DataGetter.get_categories
        list.each do |cat|
            CategoryList.new(cat)
        end
        select_category
    end

    

    def select_category
        puts "Please select from the following catagories:\n\n"
        puts "\n\n"
        category_lister
        puts "\n\n"
        fact_input
    end

    def category_lister
        CategoryList.all.each_with_index do |cat, idx|
            puts "#{idx + 1}: #{cat.name}"
        end
    end

    def fact_parser(category)
        response = DataGetter.choose_category(category)
        response["value"]
    end

    def fact_display(category)
        fact = self.fact_parser(category)
            puts "\n\n"
            puts fact
    end

    def fact_input
        print ":=> "
        response = gets.chomp
        if CategoryList.all.detect {|x| x.name == response} 
            fact_display(response)
        elsif response.to_i.between?(1, CategoryList.all.length)
            category = CategoryList.all[response.to_i - 1]
            fact_display(category.name)
        else
            puts "That isn't one of the categories!"
            fact_input
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