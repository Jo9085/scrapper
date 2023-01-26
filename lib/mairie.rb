require 'rubygems'
require 'nokogiri'
require 'open-uri'
#PAGE_URL = "https://www.annuaire-des-mairies.com/95/avernes.html"

def get_townhall_email(townhall_URL)

    page_1mairie = Nokogiri::HTML(URI.open(townhall_URL))

    page_1mairie.xpath('///div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
      return node.text
    end

end

get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")


def get_townhall_urls(region_URL)

    page_1region = Nokogiri::HTML(URI.open(region_URL))

    puts page_1region.xpath('//a[@class="lientxt"]').each do |node|
      puts node.text
    end
    

end

#get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")