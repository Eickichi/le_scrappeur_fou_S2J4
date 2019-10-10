require 'rubygem'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("lien"))