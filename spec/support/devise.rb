# Devise test helpers automatically included within all describe blocks

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end