def fact_input
    response = user_input_capture 
    if Category.all.detect {|x| x.name == response}
        fact_display(response)
    elsif response.to_i.between?(1, Category.all.length)
        category = Category.all[response.to_i - 1]
        fact_display(category.name)
    elsif QUIT_INPUT.include?(response.downcase)
        exit_app
    else
        puts "Invalid response! Please enter \na number or name of a category \nor 'quit' to exit."
        fact_input
    end
    fact_input
end

