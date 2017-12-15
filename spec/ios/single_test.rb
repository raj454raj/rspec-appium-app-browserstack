require_relative '../../scripts/browserstack.rb'

describe "Wordpress login" do
  it "can submit a request to wordpress login" do
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until { @driver.find_element(:accessibility_id, "Log In").displayed? }
    login_button = @driver.find_element(:accessibility_id, "Log In")
    login_button.click

    wait.until { @driver.find_element(:accessibility_id, "Email address").displayed? }
    email_input = @driver.find_element(:accessibility_id, "Email address")
    email_input.send_keys("hello@browserstack.com")

    wait.until { @driver.find_element(:accessibility_id, "Next").displayed? }
    @driver.find_element(:accessibility_id, "Next").click
    sleep 5

    results = @driver.find_elements(:xpath, "//XCUIElementTypeStaticText")
    result = results.map(&:text).any?{|x| x.match('not registered on WordPress.com')}
    expect(result).to eq(true)
  end
end
