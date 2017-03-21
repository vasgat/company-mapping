module Company
  module Mapping

    #Implements Cosine Similarity between two non zero vectors and it measures the cosine of the angle between them.
    class CosineSimilarity

      #Calculates cosine similarity between two documents. The documents are expressed as vectors of tokens (bag of words model).
      def calculate(doc1, doc2)
        (dotProduct(doc1, doc2) / (Math.sqrt(d(doc1)) * Math.sqrt(d(doc2)))).round(4)
      end

      protected
      #Calculated the dot product between the two document vectors. The dot product is an algebraic operation
      # that takes two equal-length sequences of numbers (usually coordinate vectors) and returns a single number.
      def dotProduct(doc1, doc2)
        common_tokens(doc1.keys, doc2.keys).inject(0.0) do |dot_product, token|
          dot_product + doc2[token] * doc1[token]
        end
      end

      #Calculates the magnitude of a vector document
      def d(doc)
        doc.keys.inject(0.0) do |d, term|
          d + doc[term]**2.0
        end
      end

      #returns the set of common tokens between two document vectors
      def common_tokens(doc1_tokens, doc2_tokens)
        common_tokens = Set.new doc1_tokens
        common_tokens.intersection(Set.new doc2_tokens)
      end
    end
  end
end
