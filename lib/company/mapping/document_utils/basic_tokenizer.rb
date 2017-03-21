#BasicTokenizer breaks given strings to a set of tokens. As tokens are regarded the words and the sequences of
# the numbers the string contains.
module Company
  module Mapping
    class BasicTokenizer

      def initialize(ignorePunctuation = true, ignoreCase = true)
        @doIgnorePunctuation, @doIgnoreCase = ignorePunctuation, ignoreCase
      end

      def to_s
        "{BasicTokenizer: (IgnoresPunctuation: #@doIgnorePunctuation, IgnoresCase: #@doIgnoreCase)}"
      end

      def tokenize(text)
        text = tranform(text)
        tokens = Array.new
        index = 0
        while (index < text.length)
          char = text[index]
          case char
          when /\s/
            index = index + 1
          when /\w/ #/(?<word>\w+)/
            buf = ""
            while ((index < text.length) && (text[index].match(/\w/)))
              buf << text[index]
              index += 1
            end
            tokens.push buf
            index += 1
          else
            tokens.push(char) unless @doIgnorePunctuation
            index += 1
          end
        end
        tokens
      end

      private
      def tranform(text)
        @doIgnoreCase ? text.to_s.downcase : text.to_s
      end
    end
  end
end