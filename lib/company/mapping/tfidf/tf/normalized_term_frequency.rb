module Company
  module Mapping

# NormalizedTermFrequency inherits from TermFrequency class. It calculates Term Frequency as
# logarithmically scaled frequency: tf(t,d) = 1 + log(f(t,d)), or zero if
# f(t,d) is zero.

    class NormalizedTermFrequency < TermFrequency
      def calculate(text)
        rawFrequency(text).each_with_object({}) do |(key, value), logTF|
          logTF[key] = 1.0 + Math.log(value)
        end
      end
    end
  end
end