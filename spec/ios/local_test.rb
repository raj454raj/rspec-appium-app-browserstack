require_relative '../../scripts/browserstack.rb'

describe "BrowserStack Local Testing" do
  it "can hit a local url" do
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until { @driver.find_element(:accessibility_id, "TestBrowserStackLocal").displayed? }
    test_button = @driver.find_element(:accessibility_id, "TestBrowserStackLocal")
    test_button.click

    wait.until do
      value = @driver.find_element(:accessibility_id, "ResultBrowserStackLocal").attribute("value")
      !value.nil? && value.size > 0
    end
    result_element = @driver.find_element(:accessibility_id, "ResultBrowserStackLocal")
    expect(result_element.text.match("Up and running")).to be_truthy
  end
end
