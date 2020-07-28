require_relative "./data_getter"
require_relative "./data_handler"

class CliProject::ConsoleControl

    def initialize(name)
        @name = name
    end

    def run
        puts "Welcome to Chuck Norris facts!"
    end

end