require 'capybara'

case ENV['TARGET']
  when 'which-live' then
    Capybara.app_host = 'http://www.which.co.uk/'
    puts "\n>>>> ENVIRONMENT = WHICH.CO.UK <<<<\n\n"
end