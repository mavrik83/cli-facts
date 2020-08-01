# CLI Chuck Norris Fact Generator

## Introduction

Just what we all need, another Chuck Norris fact generator! There are no jokes about Chuck Norris, only facts. 

Here is my project. Have fun!

## Code Samples


    # Calls the API for an array of categories and
    # assigns it to the variable. Iterates over the 
    # array and instantiates a new object for each element.
    def list_builder
        list = API.get_categories
        list.each do |cat|
            Category.new(cat)
        end
    end

## Installation

1. Open your terminal. 
2. Install the 'HTTParty' gem: `gem install httparty`
3. Go to the enclosing project folder: `/yourdirectory/cli-facts`
4. Run `ruby bin/run`

## Features

Nothing fancy here, but there a few features i'm proud of:

1. You can exit from anywhere in the app by typing any of the following: 'exit', 'quit', 'x', or 'q'. They are not case sensitive.
2. Similarly, when selcting a category, you can type the name of the category or the corresponding number.

