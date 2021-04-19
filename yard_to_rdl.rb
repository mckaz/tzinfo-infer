require 'yard'
require_relative 'type_converter.rb'

ERROR_LOG = "errors.log"

def generate_yard_doc
  YARD::Registry.clear
  "Generating yard doc..."
  system "mv readme tmp_readme" if File.directory? "readme" ## "readme" directory triggers error in YARD
  YARD::CLI::Yardoc.run('-n')
  YARD::Registry.load
end

def yard_to_rdl(meths)
  #file = File.open("orig_types.rb", "w")
  meths.each { |m|
    next unless m.is_explicit?
    klass_name = m.namespace
    meth_name = m.name
    meth_arg_types = []
    m.tags(:param).each { |param|
      raise "Expected types for parameter #{param}" unless param.types
      begin
        meth_arg_types << YARDTC::Parser.parse(param.types)
      rescue SyntaxError
        File.open(ERROR_LOG, "a") { |f| f.puts("Class: #{m.namespace}, Method: #{meth_name}, Parameter: #{param.name}, Type: #{param.types}, File: #{m.file}") }
      end
    }

    #next unless m.tags(:return).size == 1          
    ret = m.tags(:return)[0] if m.tags(:return).size == 1

    begin
      if m.constructor?
        ret_type = "self"
      elsif !(m.tags(:return).size == 1)
        ret_type = "%bot"
      else
        ret_type = YARDTC::Parser.parse(ret.types) if ret.types
      end
    rescue
      File.open(ERROR_LOG, "a") { |f| f.puts("Class: #{m.namespace}, Method: #{meth_name}, Return Type: #{param.types}, File: #{m.file}") }
    end

    if m.tag(:yield) || !m.tags(:yieldparam).empty? || m.tag(:yieldreturn)
      puts "Got block type, but handling is not yet implemented."
    end

    orig_type = "RDL.orig_type Object.const_get('#{klass_name}'), '#{if (m.scope == :class) then "self." end}#{meth_name}', '(#{meth_arg_types.join(", ")}) -> #{ret_type}', wrap: false, typecheck: :later\n"
    #file.puts orig_type
    File.open("orig_types.rb", "a") { |f| f.write orig_type }
  }
end

def gen_rdl_types
  ## TODO: how to determine directory?
  generate_yard_doc
  meths = YARD::Registry.all(:method)
  yard_to_rdl(meths)
end
