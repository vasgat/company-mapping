module Company
  module Mapping
    class Corpus < Set
      alias_method :push, :add
    end
  end
end
