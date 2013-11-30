#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'cinch'
require 'rjb'

load './misawa_good_thing.rb'
load './lib/kuromoji.rb'




class MisawaBot
  include Cinch::Plugin
  include Kuromoji::Core

  match /.*/, use_prefix: false

  def execute(m)
    nouns = []
    tokenize(m.message).each do |t|
      nouns << t.surface_form if t.part_of_speech.include? "名詞"
    end
    noun = nouns.sample

    unless noun.nil? || noun.empty?

      good_thing = MisawaGoodThing.any_of(alt: /.*#{nouns.sample}.*/).sample

      m.reply "#{good_thing.alt}"
      m.reply "#{good_thing.src}"
    end

  end
end


bot = Cinch::Bot.new do
  configure do |c|
    c.server = "192.168.0.221"
    c.channels = ["#sd"]
    c.nick = 'misawa_bot'
    c.plugins.plugins = [MisawaBot]
  end
end

bot.start
