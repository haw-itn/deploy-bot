# -*- coding: utf-8 -*-
require 'rubygems'
require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "192.168.0.221"
    c.channels = ["#sd"]
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end

  on :message, "うんこ" do |m|
    m.reply "#{m.user.nick} おまえのことだよ！"
  end

  on :message, "misawa" do |m|
    m.reply "http://img-cdn.jg.jugem.jp/a64/1131071/20131129_874168.gif"
  end

end

bot.start
