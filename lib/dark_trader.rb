require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'byebug'

def scraper
    parsed_page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
    names = []
    prices = []
    crypto_names = parsed_page.css('.cmc-table-row')
    crypto_names.each do |crypto_name|
        names.push(crypto_name.css('a.cmc-link')[0]&.text)
        prices.push(crypto_name.css('a.cmc-link')[2]&.text)
    end
    print my_hash = names.zip(prices).to_h
end

scraper