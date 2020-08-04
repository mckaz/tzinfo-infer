require './lib/tzinfo'
#require '../type-infer/rdl/lib/rdl'
require 'rdl'
RDL::Config.instance.number_mode = true
require 'types/core'

RDL.no_infer_meth TZInfo::TimeWithOffset, :localtime # some issue about varargs
RDL.no_infer_meth TZInfo::Timestamp, :initialize
# appears to be an occurence typing issue, but not completely clear.
# The var @utc_offset can be either a symbol or an integer.
# Hard to tell if there are appropriate checks in all its uses, so potential type error here.
RDL.no_infer_meth TZInfo::Timezone, :offsets_up_to
RDL.no_infer_file("./lib/tzinfo/with_offset.rb") ## mixins

RDL.no_infer_file("./lib/tzinfo/data_sources/zoneinfo_data_source.rb") ## a whole bunch of issues here that are hard to debug... mostly data structure related

RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :initialize ## undefined constant error... uses this constant only after checking "const_defined?", so this is essentially occurence typing issue.
RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :load_timezone_info ## again undefined constant error, but this one inside begin/rescue that checks for NameError
RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :require_definition ## getting cant_splat error from line 609 in typecheck.rb... not sure why this error exists here
RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :version_info ## again with the undefined constant error, with const_defined?

RDL.no_infer_file "./lib/tzinfo/format1/country_index_definition.rb" ## mixins
RDL.no_infer_file "./lib/tzinfo/format1/timezone_index_definition.rb" ## mixins
RDL.no_infer_file "./lib/tzinfo/format1/timezone_definition.rb" ## mixins
RDL.no_infer_file "./lib/tzinfo/format2/timezone_index_definition.rb" ## mixins
RDL.no_infer_file "./lib/tzinfo/format2/country_index_definition.rb" ## mixins
RDL.no_infer_file "./lib/tzinfo/format2/timezone_definition.rb" ## mixins

RDL.infer_all "./lib/tzinfo/"
RDL.infer_all "./lib/tzinfo/data_sources/"
RDL.infer_all "./lib/tzinfo/format1/"
RDL.infer_all "./lib/tzinfo/format2/"



=begin
RDL.infer_file "./lib/tzinfo/data_sources/constant_offset_data_timezone_info.rb"
RDL.infer_file "./lib/tzinfo/data_sources/country_info.rb"
RDL.infer_file "./lib/tzinfo/data_sources/data_timezone_info.rb"
RDL.infer_file "./lib/tzinfo/data_sources/linked_timezone_info.rb"


RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :initialize ## undefined constant error... uses this constant only after checking "const_defined?", so this is essentially occurence typing issue.
RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :load_timezone_info ## again undefined constant error, but this one inside begin/rescue that checks for NameError
RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :require_definition ## getting cant_splat error from line 609 in typecheck.rb... not sure why this error exists here
RDL.no_infer_meth TZInfo::DataSources::RubyDataSource, :version_info ## again with the undefined constant error, with const_defined?
RDL.infer_file "./lib/tzinfo/data_sources/ruby_data_source.rb"


RDL.infer_file "./lib/tzinfo/data_sources/timezone_info.rb"
RDL.infer_file "./lib/tzinfo/data_sources/transitions_data_timezone_info.rb"

## Having all sorts of troubles with the below file
#RDL.infer_file "./lib/tzinfo/data_sources/zoneinfo_data_source.rb"
RDL.infer_file "./lib/tzinfo/data_sources/zoneinfo_reader.rb"
=end



=begin
RDL.infer_file "./lib/tzinfo/country_timezone.rb"

RDL.infer_file "./lib/tzinfo/country.rb"

RDL.infer_file "./lib/tzinfo/data_source.rb"

RDL.infer_file "./lib/tzinfo/data_timezone.rb"

RDL.infer_file "./lib/tzinfo/datetime_with_offset.rb"
RDL.infer_file "./lib/tzinfo/format1.rb"
RDL.infer_file "./lib/tzinfo/format2.rb"
RDL.infer_file "./lib/tzinfo/info_timezone.rb"
RDL.infer_file "./lib/tzinfo/linked_timezone.rb"
RDL.infer_file "./lib/tzinfo/offset_timezone_period.rb"
RDL.infer_file "./lib/tzinfo/string_deduper.rb"


RDL.no_infer_meth TZInfo::TimeWithOffset, :localtime # some issue about varargs
RDL.infer_file "./lib/tzinfo/time_with_offset.rb"

RDL.no_infer_meth TZInfo::Timestamp, :initialize
# appears to be an occurence typing issue, but not completely clear.
# The var @utc_offset can be either a symbol or an integer.
# Hard to tell if there are appropriate checks in all its uses, so potential type error here.
RDL.infer_file "./lib/tzinfo/timestamp.rb"



#RDL.no_infer_meth TZInfo::TimestampWithOffset, 'self.set_timezone_offset'
## calls superclass Timestamp's new! method, which creates a new instance of self.
## But, TimestampWithOffset knows only that it creates a Timestamp, not self.
## nvm, I just used a typecast
RDL.infer_file "./lib/tzinfo/timestamp_with_offset.rb"


RDL.no_infer_meth TZInfo::Timezone, :offsets_up_to
# Getting an "invalid constraint" error... hard to tell exactly why,
# likely involves a long string of methods.
# Perhaps, build on error messages so thatprint entire thread of subtypes?
RDL.infer_file "./lib/tzinfo/timezone.rb"

RDL.infer_file "./lib/tzinfo/timezone_offset.rb"
RDL.infer_file "./lib/tzinfo/timezone_period.rb"
RDL.infer_file "./lib/tzinfo/timezone_proxy.rb"
RDL.infer_file "./lib/tzinfo/timezone_transition.rb"
RDL.infer_file "./lib/tzinfo/transitions_timezone_period.rb"
RDL.infer_file "./lib/tzinfo/version.rb"

# two methods in below file. can't be inferred because they are mixin methods, call out to other methods that aren't present here.
#RDL.infer_file "./lib/tzinfo/with_offset.rb"
=end

RDL.do_infer :files, num_times: 11
