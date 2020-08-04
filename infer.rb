# coding: utf-8
require './lib/tzinfo'
require '../type-infer/rdl/lib/rdl'
require 'types/core'



RDL.infer TZInfo::CountryTimezone, 'initialize', time: :later
RDL.infer_var_type TZInfo::CountryTimezone, :@identifier
RDL.infer_var_type TZInfo::CountryTimezone, :@latitude
RDL.infer_var_type TZInfo::CountryTimezone, :@longitude
RDL.infer_var_type TZInfo::CountryTimezone, :@description

RDL.infer TZInfo::CountryTimezone, :timezone, time: :later
RDL.infer TZInfo::CountryTimezone, :description_or_friendly_identifier, time: :later
RDL.infer TZInfo::CountryTimezone, :==, time: :later
RDL.infer TZInfo::CountryTimezone, :eql?, time: :later
RDL.infer TZInfo::CountryTimezone, :hash, time: :later

RDL.infer TZInfo::Country, 'self.get', time: :later
RDL.infer TZInfo::Country, 'self.all_codes', time: :later
RDL.infer TZInfo::Country, 'self.all', time: :later
RDL.infer TZInfo::Country, 'self.data_source', time: :later

RDL.infer TZInfo::Country, 'initialize', time: :later
RDL.infer_var_type TZInfo::Country, :@info

RDL.infer TZInfo::Country, 'code', time: :later

#RDL.infer TZInfo::Country, 'name', time: :later
# Weird error with the above one. Get a stack overflow error (infinite recursion).
# This results when we attempt to apply the struct-to-nominal rule to @info, resulting
# in the following two constraints both existing:
# { TZInfo::Country#name ret: ret } <= { { TZInfo::Country# var: @info }#name ret: ret }
# { { TZInfo::Country# var: @info }#name ret: ret } <= { TZInfo::Country#name ret: ret }
# i.e., a cycle in the constraint graph. This doesn't result in any invalid constraints,
# so the cycle stays in the graph. Later on when we try to add new constraints, we get the
# infinite recursion.

# This is actually okay, but somehow my stop condition on propagating constraints needs to be fixed.

RDL.infer TZInfo::Country, 'to_s', time: :later
RDL.infer TZInfo::Country, 'inspect', time: :later
RDL.infer TZInfo::Country, 'zone_identifiers', time: :later
RDL.infer TZInfo::Country, 'zones', time: :later
RDL.infer TZInfo::Country, 'zone_info', time: :later
RDL.infer TZInfo::Country, :<=>, time: :later
RDL.infer TZInfo::Country, :eql?, time: :later
RDL.infer TZInfo::Country, :hash, time: :later
RDL.infer TZInfo::Country, :=~, time: :later
RDL.infer TZInfo::Country, :_dump, time: :later
RDL.infer TZInfo::Country, 'self._load', time: :later



RDL.infer TZInfo::DataSource, 'self.get', time: :later
RDL.infer_var_type TZInfo::DataSource, "@@instance"
RDL.infer_var_type TZInfo::DataSource, "@@default_mutex"

RDL.infer TZInfo::DataSource, 'self.set', time: :later
RDL.infer TZInfo::DataSource, 'self.create_default_data_source', time: :later

## FIRST AND FOREMOST, NEED SUPPORT FOR CALLING A METHOD WITH A VARARG TYPE FOR BELOW
=begin
RDL.infer TZInfo::DataSource, :initialize, time: :later
RDL.infer TZInfo::DataSources::ZoneinfoDataSource, :initialize, time: :later
RDL.infer_var_type TZInfo::DataSources::ZoneinfoDataSource, :@zoneinfo_dir
RDL.infer_var_type TZInfo::DataSources::ZoneinfoDataSource, :@timezone_identifiers
RDL.infer_var_type TZInfo::DataSources::ZoneinfoDataSource, :@countries
RDL.infer_var_type TZInfo::DataSources::ZoneinfoDataSource, :@country_codes
RDL.infer_var_type TZInfo::DataSources::ZoneinfoDataSource, :@zoneinfo_reader
## One issue that popped up here: when climbing up the ierarchy to find a method's type,
## should we immediately create an "unknown" type for overriden methods, or should
## we climb until we find the ancestor's type?
## e.g., if class A < B, and A and B both have implemented :foo but only B has a type for foo,
## do we use B's foo type, or do we make an "unknown" type for A's foo and use that?
## Without the second `initialize` annotation above, get an error.

## Jeff says: might need a special case for #new subtyping

## Jeff says: need a new kind of constraint for splat
## probably a special kind of variable type

args’ = *args set : (a, *b) -> c zids : (d, e) -> f (d, e) -> f  \leq  (*b) -> g OR: add (*b) \leq (d,e) (a, *b) -> c  \leq   (x, y, z) -> w (y, z) \leq (*b) (y,z)  \leq  (d,e) 
From Jeffrey Foster to Everyone: (12:02 PM)
 y <= d, z <= e (*b) <= (d,e) d <= String e <= Integer b = Array<String + Integer>

Basically: either need a way of propagating constraints through splats, like *b above,
or need a way of propagating through methods with splats.
Then, to infer a splatted var type, it would just be the normal way of inferring an arg type,
but make that solution the parameter of an Array.

=end

RDL.infer TZInfo::DataSource, :get_timezone_info, time: :later
RDL.infer_var_type TZInfo::DataSource, :@timezones

RDL.infer TZInfo::DataSource, :timezone_identifiers, time: :later
RDL.infer_var_type TZInfo::DataSource, :@timezone_identifiers

RDL.infer TZInfo::DataSource, :data_timezone_identifiers, time: :later
RDL.infer TZInfo::DataSource, :linked_timezone_identifiers, time: :later
RDL.infer TZInfo::DataSource, :get_country_info, time: :later
RDL.infer TZInfo::DataSource, :country_codes, time: :later
RDL.infer TZInfo::DataSource, :to_s, time: :later
RDL.infer TZInfo::DataSource, :inspect, time: :later
RDL.infer TZInfo::DataSource, :load_timezone_info, time: :later
RDL.infer TZInfo::DataSource, :load_country_info, time: :later
RDL.infer TZInfo::DataSource, :timezone_identifier_encoding, time: :later
RDL.infer TZInfo::DataSource, :validate_timezone_identifier, time: :later
RDL.infer TZInfo::DataSource, :lookup_country_info, time: :later
RDL.infer TZInfo::DataSource, :raise_invalid_data_source, time: :later
RDL.infer TZInfo::DataSource, :build_timezone_identifiers, time: :later
RDL.infer TZInfo::DataSource, :find_timezone_identifier, time: :later
RDL.infer TZInfo::DataSource, :try_with_encoding, time: :later



RDL.infer TZInfo::DataTimezone, :period_for, time: :later
RDL.infer TZInfo::DataTimezone, :periods_for_local, time: :later
RDL.infer TZInfo::DataTimezone, :transitions_up_to, time: :later
RDL.infer TZInfo::DataTimezone, :canonical_zone, time: :later


RDL.infer TZInfo::DateTimeWithOffset, :set_timezone_offset, time: :later
RDL.infer_var_type TZInfo::DateTimeWithOffset, :@timezone_offset
RDL.infer TZInfo::DateTimeWithOffset, :to_time, time: :later
#RDL.infer TZInfo::DateTimeWithOffset, :downto, time: :later
# "super method not supported"
RDL.infer TZInfo::DateTimeWithOffset, :england, time: :later
RDL.infer TZInfo::DateTimeWithOffset, :gregorian, time: :later
RDL.infer TZInfo::DateTimeWithOffset, :italy, time: :later
RDL.infer TZInfo::DateTimeWithOffset, :julian, time: :later
RDL.infer TZInfo::DateTimeWithOffset, :new_start, time: :later
#RDL.infer TZInfo::DateTimeWithOffset, :step, time: :later
# "super method not supported"
#RDL.infer TZInfo::DateTimeWithOffset, :upto, time: :later
# "super method not supported"
RDL.infer TZInfo::DateTimeWithOffset, :clear_timezone_offset, time: :later


# Try running on Yusuke's code (in his slide deck there are links).


RDL.do_infer :later
