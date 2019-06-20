require "stanwood/version"
require 'colored2'
require 'stanwood/configurator'

module Stanwood

  def self.execute(argv)
    Stanwood::Configurator.new(argv).run
  end
end
