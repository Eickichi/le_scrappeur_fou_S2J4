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
    table_name = []
    table_mail = []

    nbr_town.times do

        name_town = page_town[n].text
        table_name << name_town

        town = page_town[n]["href"]
        n = n + 1
        lien_town = "https://www.annuaire-des-mairies.com/#{town}"

        #puts "#{name_town} : #{lien_town}"

        #récupérer le mail de chaque ville
        page2 = Nokogiri::HTML(open("#{lien_town}"))

        mail2 = page2.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
        table_mail << mail2
    end

    puts table_name
    puts table_mail
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