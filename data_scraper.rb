require 'selenium-webdriver'
require 'open-uri'
require 'nokogiri'
require 'phantomjs'

class Corp
attr_reader :name, :total, :market
def initialize(name, total, market)
@name = name
@total = total
@market = market
end
def assign_interests(name, value)

end
end

url = 'http://straylogic.com/hrpg/market/'
css_selector = ".tableContainer"
allCorps = []
 
driver = Selenium::WebDriver.for :phantomjs
driver.get(url)
driver.switch_to.default_content
capTable = driver.find_element(:css, css_selector)
cInterests = capTable.find_elements(:css, '.corpInterestTable')

cInterests.each do |interest|
arr = interest.text.split("\n")
total = arr.pop
name = arr.shift
arr.shift #clear the title of interests
market = []

arr.each do |m|
market.push(m.split(" ")[0], m.split(/[A-z|\s]+/)[1])
end

allCorps.push(Corp.new(name, total, market))

end

driver.quit