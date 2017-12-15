require_relative '../../scripts/browserstack.rb'

describe "Wikipedia Sample app" do
  it "can find search results for BrowserStack" do
    wait = Selenium::WebDriver::Wait.new(:timeout => 30)
    wait.until { @driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
    element = @driver.find_element(:accessibility_id, "Search Wikipedia")
    element.click

    wait.until { @driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text").displayed? }
    search_box = @driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text")
    search_box.send_keys("BrowserStack")
    sleep 5

    results = @driver.find_elements(:class, "android.widget.TextView")
    expect(results.count).to be > 0
  end
end
