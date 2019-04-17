require "stanwood/version"
require 'colored2'
require 'stanwood/configurator'

module Stanwood

  def self.execute(argv)
    # @message_bank.prompt_error_message(argv[0])
    # 
    # puts "Testing stanwood gem " + argv[0]
    # puts "Testing stanwood gem " + argv[1]
    # puts argv[2]
    Stanwood::Configurator.new(argv).run
  end

  # Moce to messages file

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
