require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  # Prevent database truncation if the environment is production
  abort("The Rails environment is running in production mode!") if Rails.env.production?
  require 'spec_helper'
  require 'rspec/rails'
  # Add additional requires below this line. Rails is not loaded until this point!

  # Requires supporting ruby files with custom matchers and macros, etc, in
  # spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
  # run as spec files by default. This means that files in spec/support that end
  # in _spec.rb will both be required and run as specs, causing the specs to be
  # run twice. It is recommended that you do not name files matching this glob to
  # end with _spec.rb. You can configure this pattern with the --pattern
  # option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
  #
  # The following line is provided for convenience purposes. It has the downside
  # of increasing the boot-up time by auto-requiring all files in the support
  # directory. Alternatively, in the individual `*_spec.rb` files, manually
  # require only the support files necessary.
  #
  # Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.maintain_test_schema!

  RSpec.configure do |config|
    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # RSpec Rails can automatically mix in different behaviours to your tests
    # based on their file location, for example enabling you to call `get` and
    # `post` in specs under `spec/controllers`.
    #
    # You can disable this behaviour by removing the line below, and instead
    # explicitly tag your specs with their type, e.g.:
    #
    #     RSpec.describe UsersController, :type => :controller do
    #       # ...
    #     end
    #
    # The different available types are documented in the features, such as in
    # https://relishapp.com/rspec/rspec-rails/docs
    config.infer_spec_type_from_file_location!

    config.order = "random"
    config.include Capybara::DSL
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end

#uncomment the following line to use spork with the debugger


# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.




