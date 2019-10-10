require 'nokogiri'
require 'open-uri'

def page_val_d_oise
    page0 = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    return page0
end

def get_townhall_urls
    page0 = page_val_d_oise

    page_town = page0.css('a.lientxt')
    nbr_town = page_town.length
    n = 0
    nn = 0
    table = []

    nbr_town.times do

        #Le nom de chaque ville
        name_town = page_town[n].text

        #Le lien vers la page d'accueil de chaque ville
        town = page_town[n]["href"]
        n = n + 1
        lien_town = "https://www.annuaire-des-mairies.com/#{town}"

        #Le mail de chaque ville
        page2 = Nokogiri::HTML(open("#{lien_town}"))
        mail2 = page2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
 
        #pour tout ajouter dans un hash, et le hash dans une table
        hash = {}
        hash["#{name_town}"] = mail2
        table << hash
    end

    puts table

end

get_townhall_urls

#Brouillon des étapes précédentes pour récumérer le mail d'une ville
def page_lien
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    return page
end

def get_townhall_email(lien)
    mail = lien.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    puts mail
end

def perform
    page = page_lien
    get_townhall_email(page)
end

#perform