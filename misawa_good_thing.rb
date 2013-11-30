require 'mongoid'

Mongoid.load!('misawa.yml', 'development')

class MisawaGoodThing
  include Mongoid::Document
  field :src, type: String
  field :alt, type: String
end