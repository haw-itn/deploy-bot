# -*- coding: utf-8 -*-
require 'rubygems'
require 'mongoid'

Mongoid.load!('misawa.yml', 'development')

class Misawa
  include Mongoid::Document
  field :src, type: String
  field :alt, type: String
end

misawa_datas = [{src: "http://img-cdn.jg.jugem.jp/a64/1131071/20131129_874168.gif", alt: "ようやく気付いたか新人！俺はなんだかんだでやることやってる奴じゃねえ！マジで役に立たねえんだ！"},
{src: "http://img-cdn.jg.jugem.jp/a64/1131071/20131128_872645.gif", alt: "っけね～本当の気持ちを押し殺して親友２人の恋路を後押ししちゃったよ"},
{src: "http://img-cdn.jg.jugem.jp/a64/1131071/20131127_871440.gif", alt: "っけね～スベっちゃったかと思ったら統べっちゃったよ"},
{src: "http://img-cdn.jg.jugem.jp/a64/1131071/20131126_870416.gif", alt: "見たか？あの映画の濡場(うつしえのじゅじょう)"},
{src: "http://jigokuno.img.jugem.jp/20131125_869109.gif", alt: "もっと自信持てよ今 俺はお前に食わしてもらってるんだぜ？"},
{src: "http://jigokuno.img.jugem.jp/20131122_864673.gif", alt: "割り勘じゃなくて自分が飲んだ分だけ払いたいデースでも100万円はあげマース！"},
{src: "http://jigokuno.img.jugem.jp/20131121_863334.gif", alt: "みんな優しすぎっしょ～！俺ならハッキリ言っちゃうけどな～！"},
{src: "http://jigokuno.img.jugem.jp/20131120_861850.gif", alt: "100万円あげマース！"},
{src: "http://jigokuno.img.jugem.jp/20131119_861111.gif", alt: "ハッキリ言ってアンタじゃ俺にやりがいは持たせられねえよ"},
{src: "http://jigokuno.img.jugem.jp/20131118_859989.gif", alt: "お前ら…勝ったのに俺達に何も要求しないのか…？スポーツと政治は…別…なのか…？"},
{src: "http://jigokuno.img.jugem.jp/20131115_856349.gif", alt: "海老の小籠包（かいろうのころうづつみ）"},
{src: "http://jigokuno.img.jugem.jp/20131114_855152.gif", alt: "あっ王家の紋章を持つ者もこの店来たんだ"},
{src: "http://jigokuno.img.jugem.jp/20131113_853794.gif", alt: "それは…！王家の紋章…？すいません紋章のある方の大浴場のご利用はお断りしております…！"},
{src: "http://jigokuno.img.jugem.jp/20131105_842049.gif", alt: "あいつが読んでた漫画読んだぜ…別に読んだとは言わねーけどこれで対応可能だぜ…別に言わねーけど…"},
{src: "http://jigokuno.img.jugem.jp/20131105_842048.gif", alt: "もっとだ！もっと突き詰められる！厚めのスーツで汗だくになった方がいいのか！薄いスーツで凍えてた方がいいのか！高いスーツを汚す気概を見せる手もあるぞ！もっとだ！俺達はもっとトチれるぞ！"},
{src: "http://jigokuno.img.jugem.jp/20131105_842047.gif", alt: "好きな女子が付けてたキーホルダー見つけたら買うかもな…いや付けねーよ！付けたらストーカーだろー！付けねーよ～！付けるとしても塾のカバンだろ～！"},
{src: "http://jigokuno.img.jugem.jp/20131105_842044.gif", alt: "ああ実家の犬ださねやのけんだ"},
{src: "http://jigokuno.img.jugem.jp/20131105_842043.gif", alt: "君は僕の天使だいい？天使でも"},
{src: "http://jigokuno.img.jugem.jp/20131105_842042.gif", alt: "俺みたいな使えない人間が生きていけるのが豊かっていう事なんだよ先日は本当にすいませんでした"},
{src: "http://jigokuno.img.jugem.jp/20131104_841560.gif", alt: "君は僕の宝物だよ売れば結構いい金にもなる"},
{src: "http://jigokuno.img.jugem.jp/20131101_836696.gif", alt: "君は僕にとっての太陽だよそれだけの存在だよ"},
{src: "http://jigokuno.img.jugem.jp/20131031_835245.gif", alt: "授業中に手紙を回す行為は好かないがもし回ってきたとしたら相当上手く次に回したいぜ…？"},
{src: "http://jigokuno.img.jugem.jp/20131030_833881.gif", alt: "まだ告ってないけどでもまあ結構目線の先には立ってる"},
{src: "http://jigokuno.img.jugem.jp/20131029_832791.gif", alt: "代引は親しろびけはしん"},
{src: "http://jigokuno.img.jugem.jp/20131028_830939.gif", alt: "常温の水とこぬくのすい"},
{src: "http://jigokuno.img.jugem.jp/20131025_827003.gif", alt: "悪魔と契約したのか…？何故だ…!?何故代理人抜きで契約したんだー!?"},
{src: "http://jigokuno.img.jugem.jp/20131024_825946.gif", alt: "なんで休日に大きめの公園で彼女と１５分くらいのヌルいキャッチボールしないんですか？"},
{src: "http://jigokuno.img.jugem.jp/20131023_824943.gif", alt: "あーエクセルなんですけどグラフの配色に秋らしさが欠けるので直してもらえます？"},
{src: "http://jigokuno.img.jugem.jp/20131022_824004.gif", alt: "問題ない俺は舌の裏にガムを三個まで隠すことが出来る"},
{src: "http://jigokuno.img.jugem.jp/20131021_821554.gif", alt: "デート用の店なら他を当たってくれる？"},
{src: "http://jigokuno.img.jugem.jp/20131018_818136.gif", alt: "あ～俺だけスタッフ目線だからかー！失敬～！俺だけスタッフ目線だから笑うとこ違うのかー！失敬～！こいつは失敬～！"},
{src: "http://jigokuno.img.jugem.jp/20131017_816806.gif", alt: "俺ー特大号観てると事務所の微妙な関係が気になってハラハラしちゃうんだよねー"},
{src: "http://jigokuno.img.jugem.jp/20131016_815459.gif", alt: "今年の決勝吉本何組？"},
{src: "http://jigokuno.img.jugem.jp/20131015_814134.gif", alt: "はい３回目～！俺が劇団員に間違えられたの３回目～！はいさ～ん！３～さんさ～ん！さんです～！３回目～！"},
{src: "http://jigokuno.img.jugem.jp/20131014_812413.gif", alt: "あー違う違うはいやり直しお前が本当に言いたいのはそうじゃないから"},
{src: "http://jigokuno.img.jugem.jp/20131011_807993.gif", alt: "俺が生まれる前って音楽あった？"},
{src: "http://jigokuno.img.jugem.jp/20131010_806851.gif", alt: "おめ"},
{src: "http://jigokuno.img.jugem.jp/20131009_805321.gif", alt: "そんなミス気にすんなよ…今日うちの会社の株価が暴落した原因俺だぜ…？"},
{src: "http://jigokuno.img.jugem.jp/20131008_803490.gif", alt: "綺麗すぎるんだよお前の土下座俺の土下座、きったねえぞ～！"},
{src: "http://jigokuno.img.jugem.jp/20131007_802913.gif", alt: "体育の日って知ってるか…？そうだ…！俺達は気づかない間に国から運動を強制されている…！"},
{src: "http://jigokuno.img.jugem.jp/20131004_798560.gif", alt: "『僕が使ってるわけではありませんがそのクラスの弱体化は明らかに横暴です。ユーザーの反感を買うことは間違いなくひいてはゲーム全体の評判・売上・寿命にも大きく影響するでしょう。これが改善されないようであれば僕はこのゲームをやめます。友達もそう言ってます。それに"},
{src: "http://jigokuno.img.jugem.jp/20131003_797524.gif", alt: "この前大将と野球観に行っちゃってさ～！ね～！大将～！ちょっと大将～！もう～！大将～！"},
{src: "http://jigokuno.img.jugem.jp/20131002_796399.gif", alt: "あっ大丈夫ですよこの子出身が渋谷に近くなくても噛み殺さないんですよ～"},
{src: "http://jigokuno.img.jugem.jp/20131001_794473.gif", alt: "まっ美味いけどブログで紹介できるレベルかなっ？"},
{src: "http://jigokuno.img.jugem.jp/20130927_789047.gif", alt: "お前ビートルズ何周目？俺？俺は昨日から７周目に入ったけどなに？"},
{src: "http://jigokuno.img.jugem.jp/20130924_785049.gif", alt: "あ～呆れる\r\nホンット自分に呆れるせっかくみんなで海来てんのに音楽のことばっか考えてんだぜ？"},
{src: "http://jigokuno.img.jugem.jp/20130923_783617.gif", alt: "元々会社が休みの日に仕事を休んでも仕事を休んだ気にはならねえんだよ！"},]

# misawa_datas.each do |mi|
#   Misawa.new(mi).save
# end
p "---"
Misawa.any_of(alt: /.*僕.*/).each do |m|
  p m
end

p Misawa.any_of(alt: /.*僕.*/).sample
# Misawa.all.each do |m|
#   p m
# end
