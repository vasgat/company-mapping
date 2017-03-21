module Company
  module Mapping
    class CompanyCorpus < Corpus
      def initialize(path=nil)
        super()
        import_csv path if path
      end

      def add id, company_name, aliases=[]
        push doc(company_name, id)
        aliases.each_with_index do |company_alias, i|
          push doc(company_alias, "#{id}_#{i}")
        end
      end

      # build a corpus from a csv file
      def import_csv path
        CSV.foreach(path) do |row|
          array = row.first.split(";")
          add array.first, array[1], array[2..-1]
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
