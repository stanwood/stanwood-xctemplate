
require 'colored2'

module Stanwood
  class Messanger

    attr_reader :configurator

    def initialize()
    end

    def prompt_command_error_message(command)
      puts "\n"
      puts "[!] Unknown command: `".red + command.red + "`".red
      puts "Did you mean: ".red + "create" + "?".red
      puts "\nTo get help, run $ stanwood --help"
      puts "\n"
    end

    def prompt_help_message()
      puts ""
      puts "Usage:".bold.underlined
      puts ""
      puts "    $ stanwood COMMAND ENV"
      puts "    Stanwood, the stanwood architecture template manager"
      puts "\n\n"

      puts "Commands:".bold.underlined
      puts "\n\n"
    end

    def ask_with_answers(question, possible_answers)

        print "\n#{question}? ["

        print_info = Proc.new {

          possible_answers_string = possible_answers.each_with_index do |answer, i|
             _answer = (i == 0) ? answer.underlined : answer
             print " " + _answer
             print(" /") if i != possible_answers.length-1
          end
          print " ]\n"
        }
        print_info.call

        answer = ""

        loop do
          show_prompt
          answer = gets.downcase.chomp

          answer = "yes" if answer == "y"
          answer = "no" if answer == "n"

          # default to first answer
          if answer == ""
            answer = possible_answers[0].downcase
            print answer.yellow
          end

          break if possible_answers.map { |a| a.downcase }.include? answer

          print "\nPossible answers are ["
          print_info.call
        end

        answer
      end

      def show_prompt
        print " > ".green
      end
  end
end
