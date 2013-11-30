# -*- coding: utf-8 -*-
require 'rubygems'

require 'nokogiri'
require 'open-uri'

load './misawa_good_thing.rb'
p "START 地獄のミサワをスクレイプ"


host = 'http://jigokuno.com/'
500.times do |i|
  p "DONE #{i} pages." if i % 10 == 0

  page = i == 0 ? host : "#{host}?page=#{i}"

  hell = Nokogiri::HTML(open(page))

  hell.css('div.jgm_entry_desc_mark > img').each  do |img|
    src = img['src']
    alt = img['alt']

    # for debug
    # if alt.nil?
    #   p hell.css('.entry_area img')
    #   p "page:#{i}, #{src}, #{alt}"
    # end

    MisawaGoodThing.new(src: src, alt: alt).save unless alt.empty?
  end
end

p "END  地獄のミサワをスクレイプ"


MisawaGoodThing.any_of(alt: /.*僕.*/).each do |m|
  p m
end

p MisawaGoodThing.any_of(alt: /.*僕.*/).sample
# Misawa.all.each do |m|
#   p m
# end
