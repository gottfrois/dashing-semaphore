module Dashing
  module Semaphore
    class Engine < ::Rails::Engine

      config.assets.paths.unshift       Dashing::Semaphore::Engine.root.join('vendor', 'assets', 'javascripts', 'dashing')
      config.assets.paths.unshift       Dashing::Semaphore::Engine.root.join('vendor', 'assets', 'stylesheets', 'dashing')
      config.assets.paths.unshift       Dashing::Semaphore::Engine.root.join('vendor', 'assets', 'images')
      config.paths['app/views'].unshift Dashing::Semaphore::Engine.root.join('app', 'views', 'dashing', 'semaphore')

      initializer 'require dashing semaphore jobs' do
        Dir[Dashing::Semaphore::Engine.root.join('app', 'jobs', '**', '*.rb')].each { |file| require file }
      end

    end
  end
end
