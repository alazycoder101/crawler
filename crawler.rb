require "capybara/dsl"
require "selenium-webdriver"
require 'debug'

chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)

chrome_opts = chrome_bin ? { "chromeOptions" => { "binary" => chrome_bin } } : {}

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(
     app,
     browser: :chrome,
     desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts)
  )
end

Capybara.javascript_driver = :chrome
Capybara.default_max_wait_time = 60 #default: 5
Capybara.default_driver = :chrome

class Crawler
  include Capybara::DSL

  def initialize
  end

  def flight(from, to, date)
    visit "https://skyscanner.net"
    click_on 'OK'
    sleep(5)
    fill_in 'fsc-origin-search', visible: true, with: from
    sleep(5)
    fill_in 'fsc-destination-search', visible: true, with: to + "\n"
    sleep(5)
    click_on 'Search flights'
    sleep(50)
  end

  def qunar(date)
    visit 'https://flight.qunar.com/site/oneway_list_inter.htm?searchDepartureAirport=%E4%BC%A6%E6%95%A6&searchArrivalAirport=%E4%B8%8A%E6%B5%B7&searchDepartureTime=2022-07-25'
    sleep(3)
    click_on '.price-calendar'
    sleep(50)
  end

  def lufthansa(from, to, date)
    visit 'https://www.lufthansa.com/gb/en/homepage'
    click_on 'Agree'
    sleep(1)
    click_on 'Close'
    sleep(1)
    fill_in 'flightQuery.flightSegments[0].originCode', with: from
    sleep(1)
    find('flightQuery.flightSegments[0].originCode').native.send_keys(:enter)
    fill_in 'flightQuery.flightSegments[0].destinationCode', with: to + "\n"
    click_on 'Continue'
    check 'isOneWay'
    find(:css, "[name='isOneWay']").set(true)
    sleep(1)
    click_on 'Search flights'
    sleep(50)
  end

  def austrian(from, to, date)
    visit "https://www.austrian.com/xx/en/book-and-manage/flights"
    click_on 'Agree'
    fill_in('flightQuery.flightSegments[0].originCode', with: from)
    sleep(1)
    send_keys("\n")

    fill_in('flightQuery.flightSegments[0].destinationCode', with: to)
    sleep(1)
    send_keys("\n")
    # check 'One-way'
    find('span', text: 'One-way').click
    click_on 'SEARCH FLIGHTS'

    sleep 10
    visit "https://www.austrian.com/xx/en/offers/flight-#{from}-#{to}"
    result = page.find('div.scroll-container').text
    result.split(Date.today.year.to_s).each do |row|
      next unless row.include? 'from'
      puts row
    end
  end
end

crawler = Crawler.new
#crawler.lufthansa('London Heathrow', 'Shanghai - Pu Dong', '28/07/2022')
#crawler.lufthansa('London', 'Shanghai Pu Dong (PVG)', '2022-07-28')
crawler.austrian('london', 'shanghai', '2022-07-28')
