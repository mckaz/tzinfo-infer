require 'tzinfo/timezone_definition'

module TZInfo
  module Definitions #:nodoc:
    module America #:nodoc:
      module Caracas #:nodoc:
        include TimezoneDefinition
        
        timezone 'America/Caracas' do |tz|
          tz.offset :o0, -16064, 0, :LMT
          tz.offset :o1, -16060, 0, :CMT
          tz.offset :o2, -16200, 0, :VET
          tz.offset :o3, -14400, 0, :VET
          
          tz.transition 1890, 1, :o1, 1627673863, 675
          tz.transition 1912, 2, :o2, 10452001043, 4320
          tz.transition 1965, 1, :o3, 39020187, 16
        end
      end
    end
  end
end
