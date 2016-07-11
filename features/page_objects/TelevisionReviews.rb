class TelevisionReviews < SitePrism::Page
  set_url "/reviews/televisions?{params}"

  #Filters
  element :size_filter_17_22, :css, ".SYw88 ._1Locb label[for='17854_17_22']"
  element :show_more_retailers, :css, "aside > section:nth-child(10) > ul > li._3_I14 > button"
  elements :retailers_all, :xpath, "//section[9]/ul[@class='_1YbKp']/li"
  elements :retailers_hidden, :xpath, "//section[9]/ul[@class='_1YbKp']/li[@hidden='']"

  #List
  elements :itemprices, :css, "._2eiWj"
  elements :television_sizes, :css, "._2E1jm"

  #Sort
  element :sortdropdown, :css, "#product_listing_sorter #product_listing_sorter"

  #Banners
  element :close_labtest_banner, :css, "._21ezx .WHIom._3Uv7s"
  element :close_bestbuy_banner, :css, ".Y8bmd .WHIom._3Uv7s"

  load_validation { has_sortdropdown? }
end
