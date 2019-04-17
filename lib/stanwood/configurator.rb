require 'optparse'
require 'pathname'
require 'uri'
require 'stanwood/messanger'

module Stanwood

  class Configurator

    attr_reader :project_name, :command, :message_bank

    def initialize(argv)
      @project_name = argv[1]
      @command = argv[0]
      @message_bank = Messanger.new
    end

    def run()
      decide_exectution()
    end

    def decide_exectution()
      if @command == "create"
        puts "Creating a tempalte ...."
      elsif @command == "--help"
        parse_command_line()
      elsif @command.include? "--"
        @message_bank.prompt_command_error_message(@command)
      else
        @message_bank.prompt_command_error_message(@command)
      end
    end

    def parse_command_line()

      @message_bank.prompt_help_message()

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
  end
end
