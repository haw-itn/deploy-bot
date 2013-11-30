require 'rubygems'
require 'nokogiri'
require 'open-uri'

# http://jigokuno.com/?page=2

host = 'http://jigokuno.com/'
10.times do |i|

  page = i == 0 ? host : "#{host}?page=#{i}"
  hell = Nokogiri::HTML(open(page))

  hell.css('.entry_area img').each  do |img|
    src = img['src']
    alt = img['alt']
    p "#{src},#{alt}" unless alt.empty?
  end
end
