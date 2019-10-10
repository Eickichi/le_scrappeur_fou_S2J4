require 'nokogiri'
require 'open-uri'

def list_depute
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    return page
end

def info_depute
    page = list_depute
    table = []
  
    #le lien vers la page
    lien2 = page.xpath('/html/body/div/div[3]/div/div/section/div/article/div[3]/div/div[3]/div/ul/li/a')
    nbr = lien2.length
    n = 0

    nbr.times do
        #Pour chaque page
        lien3 = lien2[n]["href"]
        lien_depute = "http://www2.assemblee-nationale.fr#{lien3}"
        page0 = Nokogiri::HTML(open("#{lien_depute}"))

        #Pour récupérer les informations que l'on a besoin
        full_name = page0.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1').text
        name = full_name.split(/[^[[:word:]]]+/)
        first_name = name[1]
        last_name = name[2]
        mail = page0.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text

        hash = {}
        hash["first_name"] = first_name
        hash["last_name"] = last_name
        hash["email"] = mail

        table << hash

        n = n + 1
    end

    #puts table
    return table
 end

info_depute

#pour le rspec

def rspec1
    table = info_depute
    size = table.size
    puts size
    return size
end

rspec1

def rspec2(n)
    table = info_depute
    array = table[n]
    puts table[n]
    return array
end

rspec2(20)

# brouillon pour récupérer les infos

def page_depute
    page2 = Nokogiri::HTML(open("#{lien_depute}"))
    return page2
end

def info
    page2 = page_depute

    full_name = page2.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[2]/h1').text
    name = full_name.split(/[^[[:word:]]]+/)
    first_name = name[1]
    last_name = name[2]
    mail = page2.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text

    puts first_name
    puts last_name
    puts mail
end

#info