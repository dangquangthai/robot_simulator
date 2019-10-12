Dir['app/**/**.rb'].each { |file| require File.expand_path(file) }

RSpec.configure do |config|
end
