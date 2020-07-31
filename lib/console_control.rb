class ConsoleControl

    # declares and freezes acceptable input responses for menu navigation
    AFFIRMATIVE_INPUT = ["yes", "y"].freeze
    NEGATIVE_INPUT = ["no", "n"].freeze
    QUIT_INPUT = ["exit", "quit", "q", "x"].freeze

    # On starting app, #run clears the terminal screen, displays a welcome message,
    # runs #list_builder, which builds the list categories, and then moves the program
    # to #select_category
    def run
        system("clear")
        puts "\nWelcome to Chuck Norris facts!"
        puts "This app will generate a random\nChuck Norris FACT by category\n\n"
        list_builder
        select_category
    end

    # Calls the API for an array of categories and assigns it to the variable. Iterates over
    # the array and instantiates a new object for each element.
    def list_builder
        list = API.get_categories
        list.each do |cat|
            Category.new(cat)
        end
    end

    # 
    def select_category
        puts "Please select from the following catagories:\n\n"
        category_lister
        puts "\n\n"
        fact_input
    end

    def category_lister
        Category.all.each_with_index do |cat, idx|
            puts "#{idx + 1}: #{cat.name}"
        end
    end

    # this method does something
    def fact_parser(category)
        response = API.choose_category(category)
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
        if Category.all.detect {|x| x.name == response} 
            fact_display(response)
        elsif response.to_i.between?(1, Category.all.length)
            category = Category.all[response.to_i - 1]
            fact_display(category.name)
        elsif QUIT_INPUT.include?(response.downcase)
            exit_app
        else
            puts "That isn't one of the categories! Please enter\na number or the name of a category."
            fact_input
        end
        self.exit_or_rerun
    end

    def exit_or_rerun
        puts "\n\nDo you want to select another category?\n\n"
        print "yes/no? :=> "
        response = gets.chomp
        if AFFIRMATIVE_INPUT.include?(response.downcase)
            select_category
        elsif NEGATIVE_INPUT.include?(response.downcase) || QUIT_INPUT.include?(response.downcase)
            exit_app
        else
            puts "Invalid response! Please enter 'yes', 'no', or 'exit' to quit"
            exit_or_rerun
        end
    end

    def exit_app
        system("clear")
        puts "Chuck Norris disapproves of your choice...\n\n"
        exit!
    end
end