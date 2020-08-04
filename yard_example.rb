require 'yard'

YARD::CLI::Yardoc.run('-n')


YARD::Registry.load

meths = YARD::Registry.all(:method)

meths.each { |meth|
  ## Print parameter information
  puts "Class: #{meth.namespace} Method: #{meth.name}"
  puts "   Parameters:"
  meth.tags(:param).each { |param|
    ## TODO: Figure out when/why a parameter has two types.
    #raise "Expected one parameter type for class #{meth.namespace} method #{meth.name}" if param.types.length() > 1
    puts "   #{param.name} => #{param.types[0]}"
  }

  raise "Expected one return type for class #{meth.namespace} method #{meth.name}" if meth.tags(:return).length > 1
  puts "   Return:"
  if meth.tags(:return).size > 0
    if !meth.tags(:return)[0].types.nil?
      raise "Expected one parameter type for class #{meth.namespace} method #{meth.name}" if meth.tags(:return)[0].types.length() > 1    
      puts "   " + meth.tags(:return)[0].types[0].to_s
    end
  else
    ## TODO: handle case there is no return type
  end
}
