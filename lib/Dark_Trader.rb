require 'nokogiri'
require 'open-uri'

def page_lien
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    return page
end 

def dark_trader
    page = page_lien

    #Tous les prix a récupérer dans la table_price
    table_price = []
    page.css('a.price').each do |node|
        table_price << node.text
    end

    #Tous les symbol à récupérer dans la table_symbol
    table_symbol = []
    page.css('td.col-symbol').each do |node2|
        table_symbol << node2.text
    end

    nbr = table_symbol.size
    n = 0
    table = []

    #pour ranger les données dans des hash dans un tableau
    nbr.times do
        hash = {}
        hash["#{table_symbol[n]}"] = table_price[n]
        table << hash
        n = n + 1
    end
    
    puts table
    return table
end

def rspec1
    table = dark_trader
    size = table.size
    return size
end

def rspec2(n)
    table = dark_trader
    array = table[n]
    return array
end

dark_trader
