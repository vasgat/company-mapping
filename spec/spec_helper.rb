#require_relative '../lib/company/mapping/document_utils/company_corpus'
#require_relative '../lib/company/mapping/company_mapper'
require_relative '../lib/company/mapping'

shared_context "mapper" do
  before(:context) do
    corpus = Company::Mapping::CompanyCorpus.new("spec/support/data/list_of_wr_companies.csv")
    @mapper = Company::Mapping::CompanyMapper.new(corpus)
  end
end
