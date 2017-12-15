# rspec-browserstack
[Rspec](http://rspec.info/) Integration with BrowserStack.

![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780) 

<img src = 'http://rspec.info/images/logo.png' height="95">


## Setup
* Clone the repo
* Install dependencies `bundle install`
* Update `*.config.yml` files inside the `config/` directory with your [BrowserStack Username and Access Key](https://www.browserstack.com/accounts/settings)

## Run the tests
* To run a single test, run `bundle exec rake single_<device_os>`
* To run local tests, run `bundle exec rake local_<device_os>`
* To run parallel tests, run `bundle exec rake parallel_<device_os>`

## Notes
* You can view your test results on the [BrowserStack App Automate dashboard](https://www.browserstack.com/app-automate)
* To test on a different set of browsers, check out our [platform configurator](https://www.browserstack.com/automate/ruby#setting-os-and-browser)
