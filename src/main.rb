# frozen_string_literal: true

require 'selenium-webdriver'
driver = Selenium::WebDriver.for(
  :remote, url: 'http://localhost:4444', options: Selenium::WebDriver::Options.chrome
)

driver.get 'https://selenium.dev'

driver.quit
