# frozen_string_literal: true

# https://www.selenium.dev/documentation/webdriver/bidirectional/
# https://www.selenium.dev/selenium/docs/api/rb/Selenium/WebDriver/SearchContext.html

EMAIL = "#{ENV.fetch('GOOG_USER')}@gmail.com"
require 'selenium-webdriver'
driver = Selenium::WebDriver.for(
  :remote, url: 'http://localhost:4444', options: Selenium::WebDriver::Options.chrome(
    args: [
      # '--headless=new'
    ],
    exclude_switches: [
      # 'enable-automation'
    ],
    detach: false
  )
)

driver.get 'https://www.google.com/account/about/'
locator = {
  relative: {
    partial_link_text: 'Go to Google Account',
    above: {
      xpath: '//*[contains(text(), "Sign in to your Google Account")]'
    }
  }
}
driver.find_element(locator).click

driver.find_element(:css, '[aria-label="Email or phone"]').send_keys(EMAIL, :return)

# binding.irb

driver.quit
