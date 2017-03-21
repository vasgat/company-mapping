module Company
  module Mapping
    # Raw term frequency (number of times a token appears in a given string - document)
    class TermFrequency

      def initialize(tokenizer)
        @tokenizer = tokenizer
      end

      #Calculates the raw term frequency given the contents of the document.
      def calculate(text)
        rawFrequency(text)
      end

      protected
      def rawFrequency(contents)
        @tokenizer.tokenize(contents).each_with_object({}) do |token, tf|
          tf[token] ||= 0
          tf[token] += 1
        end
      end
    end
  end
end
