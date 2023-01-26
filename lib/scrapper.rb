require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(URI.open(PAGE_URL))

cryptos_arr=[]
cryptos_id=[]
cryptos_value=[]

page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[3]').each do |node|
  cryptos_id << node.text
end
#puts cryptos_id[2]

page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[5]').each do |node|
    cryptos_value << node.text
end

(0..cryptos_value.length).each do |i|
    cryptos_arr.push({cryptos_id[i] => cryptos_value[i]})
end

puts cryptos_arr