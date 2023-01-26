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

#get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")


def get_cities(region_URL)

    page_1region = Nokogiri::HTML(URI.open(region_URL))

    #puts page_1region.xpath('//a[@class="lientxt"]').each do |node|
     # puts node.text
    #end
    final_cities=[]
    cities = page_1region.css("a").select{|link| link['class'] == "lientxt"}
    #cities.each{|link| puts "#{link.text}"} 
    #cities.each{|link| final_cities << link.text}
    (0..cities.length-1).each do |i|
        final_cities << cities[i].text
    end
    return final_cities

end


def get_townhall_urls(region_URL)

    page_1region = Nokogiri::HTML(URI.open(region_URL))

    town_url = page_1region.xpath('//a[@class="lientxt"]/@href')
    town_url_clean=[]

    #(0..arraytest.length-1).each do |i|
     #   arraytest[i] = arraytest[i].gsub("./", "")
    #end  
    (0..town_url.length).each do |i|  
        town_url_clean[i] = 'https://www.annuaire-des-mairies.com/' + "#{town_url[i]}"
        town_url_clean[i] = town_url_clean[i].gsub("./","")
        #puts town_url_clean[i]
    end

    return town_url_clean
   
 
    #cities = page_1region.css("a").select{|link| link['class'] == "lientxt"}
    #cities.each{|link| puts "#{link['href']}"}    

end

#get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")

def get_all_emails(i)
    #final_cities = get_cities("https://www.annuaire-des-mairies.com/val-d-oise.html")

    #emails = []

    #(0..final_cities.length).each do |i|
       
    #     emails [i] = get_townhall_email(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")[i])
    #end

    #return emails

    return get_townhall_email(get_townhall_urls("https://www.annuaire-des-mairies.com/val-d-oise.html")[i])
end

puts get_all_emails (6)