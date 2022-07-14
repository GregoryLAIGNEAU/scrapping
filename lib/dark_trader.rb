require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'byebug'

def scraper
    parsed_page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
    names = []
    prices = []
    cryptocurrency_names = parsed_page.css('.cmc-table-row')
    cryptocurrency_names.each do |crypto_name|
        names << (crypto_name.css('a.cmc-link')[0]&.text)
        prices << (crypto_name.css('a.cmc-link')[2]&.text)
    end
    print data = names.zip(prices).to_h
end

scraper