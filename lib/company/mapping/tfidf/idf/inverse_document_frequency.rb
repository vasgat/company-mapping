module Company
  module Mapping

#InverseDocumentFrequency consists the basic implementation of inverse document frequency. It is the logarithmically
#scaled inverse fraction of the documents that contain the token, obtained by dividing the total number of documents by
#the number of documents containing the token, and then taking the logarithm of that quotient.
    class InverseDocumentFrequency

      def initialize(corpus)
        @corpus = corpus
      end

      #Calculates the basic Inverse Document Frequency of each token contained in a corpus of documents.
      def calculate
        document_frequency.each_with_object({}) do |(word, freq), idf|
          idf[word] = Math.log(@corpus.size/freq)
        end
      end

      def maxIDF
        Math.log(@corpus.size * 1.0)
      end

      protected

      #calculates the number of document occurrences of unique tokens within a corpus
      def document_frequency
        @corpus.each_with_object({}) do |doc, df|
          doc.bag_of_words.keys.each do |word|
            df[word] = (df.fetch(word) { 0.0 }) + 1.0
          end
        end
      end
    end
  end
end