require "capybara/dsl"
require "selenium-webdriver"

Capybara.register_driver :crawler_driver do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.default_driver = :crawler_driver

class Crawler
  include Capybara::DSL

  def initialize
    visit "http://www.google.com"
  end
end

crawler = Crawler.new
