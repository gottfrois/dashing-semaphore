# Dashing::Semaphore

[Dashing-Rails](https://github.com/gottfrois/dashing-rails) widget that display build status of project on Semaphore CI.

<img src="https://dl.dropbox.com/u/5802579/semaphore-dashing.png" width="600">

## Installation

Add this line to your [Dashing-Rails](https://github.com/gottfrois/dashing-rails) application's Gemfile:

    gem 'dashing-semaphore'

And then execute:

    $ bundle

## Getting Started

Follow the following steps in order to make it work on your dashing-rails project:

1. Add the following line to your `app/assets/javascripts/dashing/widgets/index.js` file:

        //= require semaphore

2. Add the following line to your `app/assets/stylesheets/dashing/widgets/index.css` file:

        *= require semaphore

3. Add the following html to your dashboard:

        <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
            <div data-id="project_id" data-view="Semaphore" data-unordered="true" data-title="ProjectTitle"></div>
        </li>

4. Run

        rails g dashing:semaphore:install

5. Edit `config/initializers/dashing-semaphore.rb` with your semaphore crendentials and project name as follow:

        Dashing::Semaphore.configure do |config|
            config.auth_token = 'your_auth_token_from_semaphore'
            config.projects   = [
                { widget_id: 'project_name/branch_name' },
                { 'dashing-rails' => 'dashing-rails/master' } # For example
            ]
        end

*Note: the branch name is optional*

*Note: the paths to index files may have changed depending on your Dashing-Rails configuration.*

## Fields

### Required

* `data-id`: Like all widgets, you must include an identifier so that your jobs can update the value. It is the same that the key value of the hash in `config/initializers/dashing-semaphore.rb`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

Full credits for this widget should go to [Aleksandar Diklic](https://github.com/rastasheep).

## License

dashing-semaphore is released under the MIT License. Developed by [rastasheep](https://github.com/rastasheep). Adapted by [gottfrois](https://github.com/gottfrois).
