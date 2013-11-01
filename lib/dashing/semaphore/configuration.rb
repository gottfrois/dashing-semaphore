module Dashing
  module Semaphore
    class Configuration

      attr_accessor :auth_token, :projects

      def initialize
        @auth_token = ''
        @projects   = []
      end

    end
  end
end
