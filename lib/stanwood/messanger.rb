
require 'colored2'
require 'colorize'

module Stanwood
  class Messanger

    attr_reader :configurator

    def prompt_command_error_message(command)
      puts "\n"
      puts "[!] Unknown command: `".colorize(:red) + command.red + "`".colorize(:red)
      puts "Did you mean: ".colorize(:red) + "create" + "?".colorize(:red)
      puts "\nTo get help, run $ stanwood --help"
      puts "\n"
    end

    def prompt_option_error_message(command)

      if command.nil? || command.empty?
        puts "\n"
        puts "[!] Missing option".colorize(:red)
        puts "Did you mean: ".colorize(:red) + "--help" + "?".colorize(:red)
        puts "\nTo get help, run $ stanwood --help"
        puts "\n"
      elsif command == "--help" || command == "--version"
        puts "\n"
        puts "[!] Unknown option: `COMMAND ".colorize(:red) + command.colorize(:red) + "`".colorize(:red)
        puts "Did you mean: ".colorize(:red) + "--help" + "?".colorize(:red)
        puts "\nTo get help, run $ stanwood --help"
        puts "\n"
        prompt_help_message("")
      else
        puts "\n"
        puts "[!] Unknown option: `".colorize(:red) + command.colorize(:red) + "`".colorize(:red)
        puts "Did you mean: ".colorize(:red) + "--help" + "?".colorize(:red)
        puts "\nTo get help, run $ stanwood --help"
        puts "\n"
      end
    end

    # Add a switch message
    def prompt_help_message(command)

      case
      when command.nil? || command.empty?
        puts ""
        puts "Usage:".bold.underlined
        puts ""
        puts "    $ stanwood " + "COMMAND".colorize(:light_green)
        puts "    Stanwood, the stanwood architecture template manager"
        puts "\n"
        puts "Commands:".bold.underlined
        puts ""
        print "     + create".colorize(:light_green) + "                        Create a new project template"
        puts "\n"
      when command == "create"
        puts ""
        puts "Usage:".bold.underlined
        puts ""
        puts "    $ stanwood " + "COMMAND".colorize(:light_green) + " PROJECT_NAME ".colorize(:light_blue) + "--PLATFORM".colorize(:light_green)
        puts "\n    Creates a stanwood project with predefined architecture components\n    named " + "`NAME`".colorize(:light_blue) + " according to our best practices."
        puts "\n"
      end
    end

    def parse_command_line(name)

      OptionParser.new do |opt|

        opt.banner = ''
        opt.separator ''
        opt.separator "Options".bold.underlined
        opt.separator ''

        opt.on('--ios', 'Create a new iOS template project') do
          puts "\n🚀🚀🚀 We are working on this awesome feature. Stay tuned!!! 🚀🚀🚀\n\n"
          exit
        end

        opt.on('--backend', 'Create a new Android template project') do
            puts "\n🚀🚀🚀 We are working on this awesome feature. Stay tuned!!! 🚀🚀🚀\n\n"
            exit
        end

        opt.on('--android', 'Create a new API template project') do
            puts "\n🚀🚀🚀 We are working on this awesome feature. Stay tuned!!! 🚀🚀🚀\n\n"
            exit
        end

        opt.on('-v', '--version', 'Print version number') do
            puts 'stanwood version: ' + Stanwood::VERSION
            exit
        end

        opt.on('-h', '--help', 'Show help banner of specified command') do |topic|
          puts opt
          puts "\n"
          exit
         end
      end.parse!
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
