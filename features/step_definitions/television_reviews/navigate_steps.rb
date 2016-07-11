Given(/^I am on the televisions review page$/) do
  $app = App.new
  $app.television_reviews.load
end
