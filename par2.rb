require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.avito.ru/moskva/avtomobili/toyota/chaser?radius=0&s_trg=13'

doc = Nokogiri::HTML(open(url))

#//div[@id='i1083021996']//span[contains(@class,'price')]

product = doc.xpath("//div//span[@itemprop='name']/text()")
price = doc.xpath("//div//span[contains(@class,'price')]/text()")
data = Hash[product.zip price]
puts product[1].to_s
puts price[1].to_s
data.each do |key,array|
    puts key
    puts array
end
CSV.open("data.csv", "wb") {|csv|data.to_a.each {|elem| csv << elem}}



