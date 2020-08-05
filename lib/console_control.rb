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

        puts " ██████ ██   ██ ██    ██  ██████ ██   ██     ███    ██  ██████  ██████  ██████  ██ ███████"
        puts "██      ██   ██ ██    ██ ██      ██  ██      ████   ██ ██    ██ ██   ██ ██   ██ ██ ██     "
        puts "██      ███████ ██    ██ ██      █████       ██ ██  ██ ██    ██ ██████  ██████  ██ ███████"
        puts "██      ██   ██ ██    ██ ██      ██  ██      ██  ██ ██ ██    ██ ██   ██ ██   ██ ██      ██"
        puts " ██████ ██   ██  ██████   ██████ ██   ██     ██   ████  ██████  ██   ██ ██   ██ ██ ███████"
        puts "\n\n"
        puts "███████  █████   ██████ ████████ ███████"
        puts "██      ██   ██ ██         ██    ██     "
        puts "█████   ███████ ██         ██    ███████"                                                  
        puts "██      ██   ██ ██         ██         ██"
        puts "██      ██   ██  ██████    ██    ███████"

        sleep(1.5)

        run_app
    end
    
    def run_app
        system("clear")
        puts "\nWelcome to Chuck Norris facts!"
        puts "This app will generate a random\nChuck Norris FACT by category\n\n"
        category_list_builder
        select_category
    end

    # Calls the API for an array of categories and assigns it to the variable. Iterates
    # over the array and instantiates a new object for each element.
    def category_list_builder
        categories = API.get_categories
        categories.each do |cat|
            Category.new(cat)
        end
    end

    # Presents the list of categories to the user then calls #fact_input to get user response.
    def select_category
        puts "Please select from the following catagories:\n\n"
        category_lister
        puts "\n\n"
        fact_input
    end

    # Iterates over the collection of categories in order to output a numbered list of
    # all categories.
    def category_lister
        Category.all.each_with_index do |cat, idx|
            puts "#{idx + 1}: #{cat.name}"
        end
    end

    # Passes the parameter, which is the user's selection, and calls the API
    # to return the JSON of the joke. Returns only the 'value' of the JSON object.
    def fact_parser(category)
        response = API.choose_category(category)
        response["value"]
    end

    # Displays the return value of #fact_parser
    def fact_display(category)
        puts "\n"
        puts fact_parser(category)
    end

    # Provides a prompt and then captures and returns the input.
    def user_input_capture
        print ">>: "
        response = gets.chomp
        response
    end

    # Get the user's selection and calls the appropriate method and then calls #exit_or_rerun.
    def fact_input
        response = user_input_capture # gets the user input and assigns it a variable.
        # iterates over the collection of categories and checks to see if user
        # input matches. If so, it runs #fact_display.
        if Category.all.detect {|x| x.name == response}
            fact_display(response)
        # checks if user input is an intenger between 1 and the length of the category array.
        # if it is, sets 'category' variable to the element at that index - 1.
        elsif response.to_i.between?(1, Category.all.length)
            category = Category.all[response.to_i - 1]
            fact_display(category.name)
        # if user input matches anything from the QUIT_INPUT constant, calls #exit_app.
        elsif QUIT_INPUT.include?(response.downcase)
            exit_app
        # if no user input matches valid responses, displays message and restarts method.
        else
            puts "That isn't one of the categories! Please enter\na number or name of a category."
            fact_input
        end
        exit_or_rerun
    end

    # Prompts the user to either choose another category or not. Accepts any input from the
    # constants AFFIRMATIVE_INPUT, NEGATIVE_INPUT, or QUIT_INPUT.
    def exit_or_rerun
        puts "\nDo you want to select another category? (yes/no/exit)\n\n"
        response = user_input_capture
        if AFFIRMATIVE_INPUT.include?(response.downcase)
            select_category
        elsif NEGATIVE_INPUT.include?(response.downcase) || QUIT_INPUT.include?(response.downcase)
            exit_app
        else
            puts "Invalid response! Please enter 'yes', 'no', or 'exit' to quit"
            exit_or_rerun
        end
    
    end

    # Clears the terminal, displays a message, and exits the application.
    def exit_app
        puts "Chuck Norris disapproves of your choice...\n\n"
        exit!
    end

end