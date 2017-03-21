require 'csv'
require_relative 'corpus'
require_relative 'text_document'

module Company
  module Mapping
    class CompanyCorpus < Corpus
      def initialize(path=nil)
        super()
        import_csv path if path
      end

      # build a corpus from a csv file
      def import_csv path
        CSV.foreach(path) do |row|
          array = row.first.split(";")

          push doc(array[1], array.first)
          array[2..-1].each_with_index do |company_alias, i|
            push doc(company_alias, "#{array.first}_#{i}")
          end
        end
        @corpus
      end

      private

      def doc content, id
        alias_doc = TextDocument.new
        alias_doc.contents = content.gsub(",", "").gsub(".", "")
        alias_doc.id = id
        alias_doc
      end
    end
  end
end
