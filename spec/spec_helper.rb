require_relative '../lib/company/mapping/document_utils/company_corpus'
require_relative '../lib/company/mapping/company_mapper'

shared_context "mapper" do
  before(:context) do
    corpus = Mapping::CompanyCorpus.new("data/list_of_wr_companies.csv")
    @mapper = Mapping::CompanyMapper.new(corpus)
  end
end
