require 'tzinfo/timezone_definition'

module TZInfo
  module Definitions #:nodoc:
    module America #:nodoc:
      module Anguilla #:nodoc:
        include TimezoneDefinition
        
        timezone 'America/Anguilla' do |tz|
          tz.offset :o0, -15136, 0, :LMT
          tz.offset :o1, -14400, 0, :AST
          
          tz.transition 1912, 3, :o1, 6532551923, 2700
        end
      end
    end
  end
end
