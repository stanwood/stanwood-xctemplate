
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
      puts "    $ stanwood COMMAND ENV"
      puts "    Stanwood, the stanwood architecture template manager"
      puts "\n\n"

      puts "Commands:".bold.underlined
      puts "\n\n"
    end
  end
end
