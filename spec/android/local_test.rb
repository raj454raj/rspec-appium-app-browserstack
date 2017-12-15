require_relative '../../scripts/browserstack.rb'

describe "BrowserStack Local Testing" do
  it "can hit a local url" do
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until { @driver.find_element(:id, "com.example.android.basicnetworking:id/test_action").displayed? }
    element = @driver.find_element(:id, "com.example.android.basicnetworking:id/test_action")
    element.click

    wait.until { @driver.find_element(:class, "android.widget.TextView").displayed? }
    text_elements = @driver.find_elements(:class, "android.widget.TextView")
    found_up_and_running = text_elements.map(&:text).any?{|x| x.match('Up and running')}
    expect(found_up_and_running).to eq(true)
  end
end
