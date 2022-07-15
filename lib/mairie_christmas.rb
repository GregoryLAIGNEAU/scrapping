require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'byebug'

def get_townhall_urls
    parsed_page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
    cities = parsed_page.css('a.lientxt')
    townhall_url = Array.new
    for i in 0...cities.length
        townhall_url.push("http://annuaire-des-mairies.com#{cities[i]['href'].delete_prefix('.')}")
    end
    townhall_url
end

def get_townhall_email(townhall_url)
    email = []
    for i in 0...townhall_url.length
        parsed_page = Nokogiri::HTML(URI.open(townhall_url[i]))
        email.push(parsed_page.css("main.page-content section.well.section-border:nth-child(2) div.container table.table.table-striped.table-mobile.mobile-primary.round-small tbody:nth-child(3) tr.txt-primary.tr-last:nth-child(4) > td:nth-child(2)").text)
        print email
    end
end

townhall_url = get_townhall_urls
get_townhall_urls
get_townhall_email(townhall_url)