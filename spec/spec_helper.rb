ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require("sinatra/activerecord")
require('pry')
require('./lib/employee')
require('./lib/division')
require('./lib/project')
require('./lib/contribution')

RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |employee|
      employee.destroy()
    end
    Division.all().each() do |division|
      division.destroy()
    end
    Project.all().each() do |project|
      project.destroy()
    end
    Contribution.all().each() do |contribution|
      contribution.destroy()
    end
  end
end
