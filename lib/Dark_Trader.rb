require 'nokogiri'
require 'open-uri'

def page_lien
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    return page
end 