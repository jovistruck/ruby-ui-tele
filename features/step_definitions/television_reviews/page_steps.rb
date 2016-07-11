When(/^I click to sort the list by descending order $/) do
  $app.television_reviews.sortbydesc.click
end

When(/^I click to close the (.*) banner/) do |bannerType|
  puts "Closing banner of type #{bannerType}"
  if bannerType=="Informational lab test"
    $app.television_reviews.close_labtest_banner.click
  elsif bannerType=="Find your best buy"
    $app.television_reviews.close_bestbuy_banner.click
  else
    fail "Invalid banner type specified"
  end
end

Then(/^I do not see the (.*) banner/) do |bannerType|
  if bannerType=="Informational lab test"
    $app.television_reviews.wait_until_close_labtest_banner_invisible
    expect($app.television_reviews).to_not have_close_labtest_banner
  elsif bannerType=="Find your best buy"
    $app.television_reviews.wait_until_close_bestbuy_banner_invisible
    expect($app.television_reviews).to_not have_close_bestbuy_banner
  else
    fail "Invalid banner type specified"
  end
  puts "Banner of type #{bannerType} found closed"
end

Then(/^I sort the list with (.*)/) do |sortby|
  puts "Sorting the list by #{sortby}"
  $app.television_reviews.sortdropdown.select(sortby)
  $app.television_reviews.sortdropdown.click
  $app.television_reviews.wait_until_itemprices_visible
end

Then(/^the items listed have their (.*)$/) do |sortby|
  if sortby=="Price (low to high)"
    tvprices = Array.new
    $app.television_reviews.itemprices.each { |itemprice| tvprices.push(itemprice.text[1..-1]) }
    puts "TV prices (low to high): #{tvprices}"
    expect(tvprices.sort).to match_array(tvprices)
  elsif sortby=="Price (high to low)"
    tvprices = Array.new
    $app.television_reviews.itemprices.each { |itemprice| tvprices.push(itemprice.text[1..-1]) }
    puts "TV prices (high to low): #{tvprices}"
    expect(tvprices.reverse).to match_array(tvprices)
  else
    fail "Invalid sort type specified"
  end
end

When(/^I filter the television list by screens of (.*)$/) do |size_range|
  if size_range=="17_22"
    $app.television_reviews.size_filter_17_22.click
    puts "Set size range to #{size_range}"
    sleep 2 #don't like it, but for headless runs. Poltergeist cannot differentiate visible when multilayered I think
    $app.television_reviews.wait_until_size_filter_17_22_visible
  else
    fail "Invalid size range specified"
  end
end

Then(/^the televisions displayed are of the size range (.*)$/) do |size_range|
  if size_range=="17_22"
    tvsizes = Array.new
    $app.television_reviews.television_sizes.each { |tvsize| tvsizes.push(tvsize.text[0..-2]) }
    puts "TV sizes found on page: #{tvsizes}"
    tvsizes.sort!
    expect(17..22).to cover(tvsizes[0].to_i)
    expect(17..22).to cover(tvsizes[-1].to_i)
    puts "Listed TVs found filtered by size!"
  else
    fail "Invalid size range specified"
  end
end

When(/^I click on the "Show more retailers" link$/) do
  $retailers_count=0
  $app.television_reviews.retailers_all.each { $retailers_count=$retailers_count+1 }
  puts $retailers_count.to_s + " retailers displayed"
  $app.television_reviews.show_more_retailers.click
  puts "Clicking show more retailers"
  sleep 4
end

Then(/^the retailers list displays added retailers$/) do
  $new_retailers_count=0
  $app.television_reviews.retailers_all.each { $new_retailers_count=$new_retailers_count+1 }
  puts $new_retailers_count.to_s + " retailers displayed"
  expect($new_retailers_count).to be > $retailers_count
end