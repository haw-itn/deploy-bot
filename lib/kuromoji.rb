module Kuromoji
  module  JavaIterator
    def each
      i = self.iterator
      while i.has_next
        yield i.next
      end
    end
  end

  module Core
    Rjb::load('lib/kuromoji-0.7.7.jar')

    Tokenizer = Rjb::import('org.atilika.kuromoji.Tokenizer')

    def tokenize sentence
      list = Tokenizer.builder.build.tokenize(sentence)
      list.extend Kuromoji::JavaIterator
    end
  end
end
