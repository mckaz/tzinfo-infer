require 'tzinfo/timezone_definition'

module TZInfo
  module Definitions #:nodoc:
    module Cuba #:nodoc:
      include TimezoneDefinition
      
      linked_timezone 'Cuba', 'America/Havana'
    end
  end
end
