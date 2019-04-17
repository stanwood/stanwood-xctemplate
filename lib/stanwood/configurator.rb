require 'optparse'
require 'pathname'
require 'uri'

module Stanwood

  class Configurator

    attr_reader :project_name, :command, :message_bank

    def initialize(name)
      # @project_name = argv[1]
      # @command = argv[0]
      puts "Hi man"
      @message_bank = Messanger.new
    end

    def self.run
      puts "Hi man"
      # parse_command_line(@project_name)
    end

    def parse_command_line(arg)

      OptionParser.new do |opt|
        opt.banner = 'Usage: jazzy'
        opt.separator ''
        opt.separator 'Options'

            # Investigate
            # self.class.all_config_attrs.each do |attr|
            #   attr.attach_to_option_parser(self, opt)
            # end

            opt.on('-v', '--version', 'Print version number') do
              puts 'stanwood version: ' + Stanwood::VERSION
              exit
            end

            opt.on('-h', '--help', 'Available topics:') do |topic|
              puts "Opt"
              puts opt

              puts "Topic"
              puts topic
              exit
            end
          end
        end
  end
end
