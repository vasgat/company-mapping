module Company
  module Mapping

#CompanyMapper given a corpus of documents (that contains company names) can map a new document with an existing one
#if one exists
    class CompanyMapper

      def initialize(corpus)
        @corpus = corpus
        @tfidf = TFIDF.new(@corpus)
        @tfidf.calculate
      end

      #maps a given company to a company exists to the given corpus. If the maximum name similarity found exceeds the given
      # threshold then the company's id is returned as a match
      def map(company, threshold)
        @tfidf.calculate_tfidf_weights_of_new_document(company)

        maxSim = 0.0
        mapped_company = ""
        @corpus.each do |d|
          similarity = @tfidf.similarity(d.id, company.id)
          next unless maxSim < similarity
          maxSim = similarity
          mapped_company = d.id
          break if maxSim == 1
        end

        return unless maxSim > threshold
        mapped_company.to_s.sub(/\_.*/, "").to_i
      end
    end
  end
end
