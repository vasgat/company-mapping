require_relative "mapping/version"

module Company
  module Mapping
  end
end

require 'csv'
require 'set'
require_relative 'mapping/document_utils/basic_tokenizer'
require_relative 'mapping/document_utils/corpus'
require_relative 'mapping/document_utils/company_corpus'
require_relative 'mapping/tfidf/tf/term_frequency'
require 'securerandom'
require_relative 'mapping/document_utils/text_document'
require_relative 'mapping/tfidf/idf/inverse_document_frequency'
require_relative 'mapping/tfidf/tf/normalized_term_frequency'
require_relative 'mapping/vector_similarity/cosine_similarity'
require_relative 'mapping/tfidf/tfidf'
require_relative 'mapping/company_mapper'
