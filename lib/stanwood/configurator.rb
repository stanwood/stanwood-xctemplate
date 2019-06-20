require 'optparse'
require 'pathname'
require 'uri'
require 'stanwood/messanger'
require 'stanwood/project_creator'
require 'fileutils'
require 'colored2'
require 'colorize'

module Stanwood

  class Configurator

    attr_reader :project_name, :command, :message_bank, :platforms, :attribute, :project_creator

    def initialize(argv)
      @command = argv[0]
      @project_name = argv[1]
      @attribute = argv[2]
      @platforms = {
        "1" => "--ios",
        "2" => "--android",
        "3" => "--backend"
      }
      @message_bank = Messanger.new
      @project_creator = ProjectCreator.new
      should_execture()
    end

    def run()
      decide_exectution()
    end

    def should_execture()
      if @command.nil? || @command.empty?
        @message_bank.prompt_command_error_message('No command found...')
        exit
      end
    end

    def decide_exectution()
      if @command == "create"
        create()
      elsif @command == "install"
        install()
      elsif @command == "--help"
        @message_bank.prompt_help_message("")
        @message_bank.parse_command_line("")
      elsif @command == "--version"
        @message_bank.parse_command_line("")
      elsif @command.include? "--"
        @message_bank.prompt_option_error_message(@command)
      else
        @message_bank.prompt_command_error_message(@command)
      end
    end

    def create()
      if @platforms.has_value?(@attribute)
        @project_creator.execute(@project_name, @attribute)
      elsif @project_name == "--help"
        @message_bank.prompt_help_message(@command)
      elsif @platforms.has_value?(@project_name)
        puts "Please include a PROJECT_NAME"
        @message_bank.prompt_help_message(@command)
      elsif @project_name.include? "--"
        @message_bank.prompt_option_error_message(@project_name)
      else
        @message_bank.prompt_option_error_message(@attribute)
      end
    end

    def install()
      if @platforms.has_value?(@project_name)
        @project_creator.executeTemplates(@project_name)
      elsif @project_name == "--help"
        @message_bank.prompt_help_message(@command)
      else
        @message_bank.prompt_option_error_message(@project_name)
      end
    end
  end
end
