# -*- coding: utf-8 -*-
require 'rubygems'
require 'cinch'
require 'mongoid'


require 'rjb'


Mongoid.load!('misawa.yml', 'development')
class Misawa
  include Mongoid::Document
  field :src, type: String
  field :alt, type: String
end



module  JavaIterator
  def each
    i = self.iterator
    while i.has_next
      yield i.next
    end
  end
end

Rjb::load('lib/kuromoji-0.7.7.jar')

Tokenizer = Rjb::import('org.atilika.kuromoji.Tokenizer')

# @tknizer = Tokenizer.builder.build

def tokenize sentence
  list = Tokenizer.builder.build.tokenize(sentence)
  list.extend JavaIterator
end


class MisawaBot
  include Cinch::Plugin

  match "a"

  def execute(m)
    m.reply "test"
  end
end


bot = Cinch::Bot.new do
  configure do |c|
    c.server = "192.168.0.221"
    c.channels = ["#sd"]
    c.plugins.plugins = [MisawaBot]
  end


  on :message, /.*/ do |m|

    nouns = []
    tokenize(m.message).each do |t|
      nouns << t.surface_form if t.part_of_speech.include? "名詞"
    end
    nouns.sample

    good_thing = Misawa.any_of(alt: /.*#{nouns.sample}.*/).sample

    m.reply "#{good_thing.alt}"
    m.reply "#{good_thing.src}"
  end

end

bot.start
