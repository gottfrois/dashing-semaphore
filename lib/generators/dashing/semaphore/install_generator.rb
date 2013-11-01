module Dashing
  module Semaphore
    module Generators
      class InstallGenerator < ::Rails::Generators::Base

        source_root File.expand_path('../../../templates', __FILE__)

        desc 'Creates semaphore.rb initializer for your application.'

        def copy_initializer
          template 'initializer.rb', 'config/initializers/dashing-semaphore.rb'
        end

        def copy_job
          template 'jobs/semaphore.rb', 'app/jobs/semaphore.rb'
        end

      end
    end
  end
end
