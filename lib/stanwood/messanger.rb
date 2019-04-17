
module Stanwood
  class Messanger

    attr_reader :configurator

    def initialize()
    #  @configurator = config
    puts "Hi messanger"
    end

    def prompt_error_message(command)
      print "[!] Unknown command: `" +   + "`".red
    end
    
  end
end
