require 'dashing/semaphore/version'

module Dashing
  module Semaphore
    class << self

      attr_accessor :configuration

      def config
        self.configuration ||= Configuration.new
      end

      def configure
        yield config if block_given?
      end
    end
  end
end

require 'dashing/semaphore/configuration'
require 'dashing/semaphore/engine'
