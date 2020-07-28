require_relative "./cli_project/version"
require "pry"
require "httparty"
require_relative './console_control'
require_relative './data_getter'
require_relative './data_handler'

module CliProject
  class Error < StandardError; end
  # Your code goes here...
end