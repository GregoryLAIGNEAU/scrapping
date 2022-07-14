require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'byebug'


# def get_townhall_email
#     url = "http://annuaire-des-mairies.com/95/ableiges.html"
#     parsed_page = Nokogiri::HTML(URI.open(url))
#     emails = parsed_page.css("main.page-content section.well.section-border:nth-child(2) div.container table.table.table-striped.table-mobile.mobile-primary.round-small tbody:nth-child(3) tr.txt-primary.tr-last:nth-child(4) > td:nth-child(2)").text
#     emails = Array.new
# end

def get_townhall_urls
    parsed_page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    cities = parsed_page.css('a.lientxt')
    townhall_url = Array.new
    for i in 0...cities.length
        townhall_url.push("http://annuaire-des-mairies.com#{cities[i]['href'].delete_prefix('.')}")
    end
    print townhall_url
end

get_townhall_urls