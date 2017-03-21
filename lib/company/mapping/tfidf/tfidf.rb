module Company
  module Mapping

#TFIDF class implements Term Frequency Inverse Document Frequency statistic. Term frequency–inverse document frequency,
# is a numerical statistic that is intended to reflect how important a word is to a document in a collection or corpus.
    class TFIDF
      attr_accessor :tf, :idf

      def initialize(corpus)
        @corpus = corpus
      end

      #Calculates the tf-idf weights in the given corpus
      def calculate
        @tfidf = Hash.new

        @idf ||= InverseDocumentFrequency.new(@corpus)
        @tf ||= NormalizedTermFrequency.new(BasicTokenizer.new)
        @idf_weights = @idf.calculate

        @corpus.each do |doc|
          termfreq = @tf.calculate(doc.contents)

          @tfidf[doc.id] =
              termfreq.each_with_object({}) do |(term, tf), tfidf_weights|
                weight = tf * @idf_weights[term]
                tfidf_weights[term] = weight
              end
        end
        @tfidf
      end

      #Calculates tfidf weights of new incoming document without importing the document in the corpus and re-calculating the tf-idf weights for the entire corpus
      def calculate_tfidf_weights_of_new_document(new_doc)
        termfreq = @tf.calculate(new_doc.contents)

        @tfidf[new_doc.id] = termfreq.each_with_object({}) do |(term, tf), tfidf_weights|
          weight = tf * (@idf_weights[term] || @idf.maxIDF)
          tfidf_weights[term] = weight
        end
        @tfidf
      end

      #Calculates tf-idf similarity between two given documents. It is actually
      #the calculated Cosine Similarity by using tf*idf weights.
      def similarity(doc1_id, doc2_id)
        @tfidf ||= calculate
        CosineSimilarity.new.calculate(@tfidf[doc1_id], @tfidf[doc2_id])
      end
    end

  end
end