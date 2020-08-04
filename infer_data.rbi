# typed: strong
module TZInfo
  class CountryTimezone
    # RDL Type: ([ freeze: () -> XXX ], Rational, Rational, ?[ freeze: () -> XXX ]) -> self
    sig do
      params(
        identifier: T.untyped,
        latitude: Rational,
        longitude: Rational,
        description: T.untyped
      ).returns(T.self_type)
    end
    def initialize(identifier, latitude, longitude, description = nil); end

    # RDL Type: () -> TZInfo::TimezoneProxy
    sig { returns(TZInfo::TimezoneProxy) }
    def timezone; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def description_or_friendly_identifier; end

    # RDL Type: (TZInfo::CountryTimezone) -> XXX
    sig { params(ct: TZInfo::CountryTimezone).returns(T.untyped) }
    def ==(ct); end

    # RDL Type: (TZInfo::CountryTimezone) -> (false or true)
    sig { params(ct: TZInfo::CountryTimezone).returns(T.any(FalseClass, TrueClass)) }
    def eql?(ct); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end
  end

  class LinkedTimezone
    # RDL Type: (TZInfo::DataSources::LinkedTimezoneInfo) -> self
    sig { params(info: TZInfo::DataSources::LinkedTimezoneInfo).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: (XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def period_for(time); end

    # RDL Type: (XXX) -> XXX
    sig { params(local_time: T.untyped).returns(T.untyped) }
    def periods_for_local(local_time); end

    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(to: T.untyped, from: T.untyped).returns(T.untyped) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def canonical_zone; end
  end

  class TransitionsTimezonePeriod
    # RDL Type: (nil, nil) -> self
    sig { params(start_transition: NilClass, end_transition: NilClass).returns(T.self_type) }
    def initialize(start_transition, end_transition); end

    # RDL Type: (TZInfo::TimezonePeriod) -> XXX
    sig { params(p: TZInfo::TimezonePeriod).returns(T.untyped) }
    def ==(p); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end
  end

  class TimezoneOffset
    # RDL Type: ([ +: (XXX) -> XXX ], Number, [ freeze: () -> XXX ]) -> self
    sig { params(base_utc_offset: T.untyped, std_offset: Integer, abbreviation: T.untyped).returns(T.self_type) }
    def initialize(base_utc_offset, std_offset, abbreviation); end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def dst?; end

    # RDL Type: ((TZInfo::TimezoneOffset or TZInfo::TimezonePeriod)) -> XXX
    sig { params(toi: T.any(TZInfo::TimezonePeriod, TZInfo::TimezoneOffset)).returns(T.untyped) }
    def ==(toi); end

    # RDL Type: ((TZInfo::TimezoneOffset or TZInfo::TimezonePeriod)) -> (false or true)
    sig { params(toi: T.any(TZInfo::TimezonePeriod, TZInfo::TimezoneOffset)).returns(T.any(FalseClass, TrueClass)) }
    def eql?(toi); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end
  end

  class Timezone
    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def identifier; end

    # RDL Type: () -> String
    sig { returns(String) }
    def name; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end

    # RDL Type: (?XXX) -> String
    sig { params(skip_first_part: T.untyped).returns(String) }
    def friendly_identifier(skip_first_part = nil); end

    # RDL Type: (XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def period_for(time); end

    # RDL Type: (XXX) -> XXX
    sig { params(local_time: T.untyped).returns(T.untyped) }
    def periods_for_local(local_time); end

    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(to: T.untyped, from: T.untyped).returns(T.untyped) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def canonical_zone; end

    # RDL Type: ((TZInfo::Timestamp or Time)) -> XXX
    sig { params(utc_time: T.any(Time, TZInfo::Timestamp)).returns(T.untyped) }
    def period_for_utc(utc_time); end

    # RDL Type: ((TZInfo::Timestamp or Time), ?[ nil?: () -> XXX ]) {((XXX or XXX)) -> XXX} -> XXX
    sig { params(local_time: T.any(Time, TZInfo::Timestamp), dst: T.untyped).returns(T.untyped) }
    def period_for_local(local_time, dst = nil); end

    # RDL Type: ((TZInfo::Timestamp or Time)) -> TZInfo::Timestamp
    sig { params(time: T.any(Time, TZInfo::Timestamp)).returns(TZInfo::Timestamp) }
    def to_local(time); end

    # RDL Type: ((TZInfo::Timestamp or Time)) -> TZInfo::Timestamp
    sig { params(utc_time: T.any(Time, TZInfo::Timestamp)).returns(TZInfo::Timestamp) }
    def utc_to_local(utc_time); end

    # RDL Type: ((TZInfo::Timestamp or Time), ?[ nil?: () -> XXX ]) {(XXX) -> XXX} -> TZInfo::Timestamp
    sig { params(local_time: T.any(Time, TZInfo::Timestamp), dst: T.untyped).returns(TZInfo::Timestamp) }
    def local_to_utc(local_time, dst = nil); end

    # RDL Type: (Number, ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?Number, ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ nil?: () -> XXX ]) {XXX} -> XXX
    sig do
      params(
        year: Integer,
        month: T.untyped,
        day: Integer,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        dst: T.untyped
      ).returns(T.untyped)
    end
    def local_time(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: (Number, ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?(Number and [ >: (Number) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ nil?: () -> XXX ]) {XXX} -> XXX
    sig do
      params(
        year: Integer,
        month: T.untyped,
        day: Integer,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        dst: T.untyped
      ).returns(T.untyped)
    end
    def local_datetime(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: (Number, ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?(Number and [ >: (Number) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ nil?: () -> XXX ]) {XXX} -> TZInfo::TimestampWithOffset
    sig do
      params(
        year: Integer,
        month: T.untyped,
        day: Integer,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        dst: T.untyped
      ).returns(TZInfo::TimestampWithOffset)
    end
    def local_timestamp(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def canonical_identifier; end

    # RDL Type: () -> TZInfo::Timestamp
    sig { returns(TZInfo::Timestamp) }
    def now; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def current_period; end

    # RDL Type: () -> [TZInfo::Timestamp, (XXX or nil)]
    sig { returns(T::Array[T.untyped]) }
    def current_time_and_period; end

    # RDL Type: (XXX, ?((TZInfo::Timestamp or Time))) -> XXX
    sig { params(format: T.untyped, time: T.any(Time, TZInfo::Timestamp)).returns(T.untyped) }
    def strftime(format, time = nil); end

    # RDL Type: (?XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def abbreviation(time = nil); end

    # RDL Type: (?XXX) -> (false or true)
    sig { params(time: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def dst?(time = nil); end

    # RDL Type: (?XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def base_utc_offset(time = nil); end

    # RDL Type: (?XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def observed_utc_offset(time = nil); end

    # RDL Type: (([ identifier: () -> XXX ] and [ is_a?: (Class) -> XXX ])) -> nil
    sig { params(tz: T.untyped).void }
    def <=>(tz); end

    # RDL Type: (XXX) -> (false or true)
    sig { params(tz: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def eql?(tz); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def hash; end

    # RDL Type: ([ =~: (XXX) -> XXX ]) -> XXX
    sig { params(regexp: T.untyped).returns(T.untyped) }
    def =~(regexp); end

    # RDL Type: (XXX) -> XXX
    sig { params(limit: T.untyped).returns(T.untyped) }
    def _dump(limit); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def raise_unknown_timezone; end
  end

  class TimezoneProxy
    # RDL Type: (XXX) -> self
    sig { params(identifier: T.untyped).returns(T.self_type) }
    def initialize(identifier); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def identifier; end

    # RDL Type: (XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def period_for(time); end

    # RDL Type: (XXX) -> XXX
    sig { params(local_time: T.untyped).returns(T.untyped) }
    def periods_for_local(local_time); end

    # RDL Type: (XXX, ?XXX) -> XXX
    sig { params(to: T.untyped, from: T.untyped).returns(T.untyped) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def canonical_zone; end

    # RDL Type: (XXX) -> XXX
    sig { params(limit: T.untyped).returns(T.untyped) }
    def _dump(limit); end

    # RDL Type: () -> TZInfo::Timezone
    sig { returns(TZInfo::Timezone) }
    def real_timezone; end
  end

  class Timestamp
    # RDL Type: () -> nil
    sig { void }
    def utc?; end

    # RDL Type: (([ ==: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ([ !=: (:utc) -> XXX ] and [ ==: ((:utc or XXX)) -> XXX ] and [ kind_of?: (Class) -> XXX ])) -> Object
    sig { params(seconds: T.untyped, utc_offset: T.untyped).returns(Object) }
    def add_and_set_utc_offset(seconds, utc_offset); end

    # RDL Type: () -> Object
    sig { returns(Object) }
    def utc; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_time; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_datetime; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_i; end

    # RDL Type: (XXX) -> XXX
    sig { params(format: T.untyped).returns(T.untyped) }
    def strftime(format); end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end

    # RDL Type: (TZInfo::Timestamp) -> nil
    sig { params(t: TZInfo::Timestamp).void }
    def <=>(t); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end

    # RDL Type: (?[ at: (XXX, XXX) -> XXX ]) -> XXX
    sig { params(klass: T.untyped).returns(T.untyped) }
    def new_time(klass = nil); end

    # RDL Type: (?[ jd: (Number) -> XXX ]) -> XXX
    sig { params(klass: T.untyped).returns(T.untyped) }
    def new_datetime(klass = nil); end

    # RDL Type: (?XXX) -> String
    sig { params(offset: T.untyped).returns(String) }
    def value_and_sub_second_to_s(offset = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def sub_second_to_s; end

    # RDL Type: (([ +: (XXX) -> XXX ] and [ to_r: () -> XXX ]), ?Number, ?XXX) -> Number
    sig { params(value: T.untyped, sub_second: Integer, utc_offset: T.untyped).returns(Integer) }
    def initialize!(value, sub_second = nil, utc_offset = nil); end
  end

  class TimestampWithOffset
    # RDL Type: ((TZInfo::Timezone or TZInfo::TimezoneOffset or TZInfo::TimezonePeriod)) -> TZInfo::TimestampWithOffset
    sig { params(timezone_offset: T.any(TZInfo::Timezone, TZInfo::TimezonePeriod, TZInfo::TimezoneOffset)).returns(TZInfo::TimestampWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_time; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_datetime; end
  end

  class OffsetTimezonePeriod
    # RDL Type: (XXX) -> self
    sig { params(offset: T.untyped).returns(T.self_type) }
    def initialize(offset); end

    # RDL Type: () -> nil
    sig { void }
    def start_transition; end

    # RDL Type: () -> nil
    sig { void }
    def end_transition; end

    # RDL Type: (([ kind_of?: (Class) -> XXX ] and [ offset: () -> XXX ])) -> XXX
    sig { params(p: T.untyped).returns(T.untyped) }
    def ==(p); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def hash; end
  end

  class Country
    # RDL Type: ((TZInfo::Country or TZInfo::DataSources::CountryInfo)) -> self
    sig { params(info: T.any(TZInfo::Country, TZInfo::DataSources::CountryInfo)).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def code; end

    # RDL Type: () -> String
    sig { returns(String) }
    def name; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def zone_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def zone_info; end

    # RDL Type: ((Parlour::RbiGenerator::Arbitrary or Pry::CodeFile or Pry::Command::Whereami or RDL::Type::ComputedType or TZInfo::Country or TZInfo::DataSources::CountryInfo)) -> nil
    sig { params(c: T.any(RDL::Type::ComputedType, Pry::CodeFile, Pry::Command::Whereami, Parlour::RbiGenerator::Arbitrary, TZInfo::Country, TZInfo::DataSources::CountryInfo)).void }
    def <=>(c); end

    # RDL Type: (XXX) -> (false or true)
    sig { params(c: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def eql?(c); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def hash; end

    # RDL Type: ([ =~: (XXX) -> XXX ]) -> XXX
    sig { params(regexp: T.untyped).returns(T.untyped) }
    def =~(regexp); end

    # RDL Type: (XXX) -> XXX
    sig { params(limit: T.untyped).returns(T.untyped) }
    def _dump(limit); end
  end

  class TimezoneTransition
    # RDL Type: ((TZInfo::Timezone or TZInfo::TimezoneOffset or TZInfo::TimezonePeriod), TZInfo::TimezoneOffset, XXX) -> self
    sig { params(offset: T.any(TZInfo::Timezone, TZInfo::TimezonePeriod, TZInfo::TimezoneOffset), previous_offset: TZInfo::TimezoneOffset, timestamp_value: T.untyped).returns(T.self_type) }
    def initialize(offset, previous_offset, timestamp_value); end

    # RDL Type: () -> TZInfo::Timestamp
    sig { returns(TZInfo::Timestamp) }
    def at; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def local_end_at; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def local_start_at; end

    # RDL Type: (TZInfo::TimezoneTransition) -> XXX
    sig { params(tti: TZInfo::TimezoneTransition).returns(T.untyped) }
    def ==(tti); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end
  end

  class TimeWithOffset
    # RDL Type: (nil) -> TZInfo::TimeWithOffset
    sig { params(timezone_offset: NilClass).returns(TZInfo::TimeWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def dst?; end

    # RDL Type: () -> TZInfo::TimeWithOffset
    sig { returns(TZInfo::TimeWithOffset) }
    def gmtime; end

    # RDL Type: (?XXX) -> XXX
    sig { params(ndigits: T.untyped).returns(T.untyped) }
    def round(ndigits = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_a; end

    # RDL Type: () -> TZInfo::TimeWithOffset
    sig { returns(TZInfo::TimeWithOffset) }
    def utc; end

    # RDL Type: () -> String
    sig { returns(String) }
    def zone; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_datetime; end
  end

  class StringDeduper
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end

    # RDL Type: ([ frozen?: () -> XXX ]) -> [ frozen?: () -> XXX ]
    sig { params(string: T.untyped).returns(T.untyped) }
    def dedupe(string); end

    # RDL Type: () {XXX} -> Hash<%any, %any>
    sig { returns(T::Hash[T.untyped, T.untyped]) }
    def create_hash; end
  end

  class ConcurrentStringDeduper
    # RDL Type: () {XXX} -> Concurrent::Map
    sig { returns(Concurrent::Map) }
    def create_hash; end
  end

  class DateTimeWithOffset
    # RDL Type: (nil) -> TZInfo::DateTimeWithOffset
    sig { params(timezone_offset: NilClass).returns(TZInfo::DateTimeWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_time; end

    # RDL Type: (XXX) {(XXX) -> XXX} -> XXX
    sig { params(min: T.untyped).returns(T.untyped) }
    def downto(min); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def england; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def gregorian; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def italy; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def julian; end

    # RDL Type: (?XXX) -> XXX
    sig { params(start: T.untyped).returns(T.untyped) }
    def new_start(start = nil); end

    # RDL Type: (XXX, ?XXX) {(XXX) -> XXX} -> XXX
    sig { params(limit: T.untyped, step: T.untyped).returns(T.untyped) }
    def step(limit, step = nil); end

    # RDL Type: (XXX) {(XXX) -> XXX} -> XXX
    sig { params(max: T.untyped).returns(T.untyped) }
    def upto(max); end

    # RDL Type: () -> TZInfo::DateTimeWithOffset
    sig { returns(TZInfo::DateTimeWithOffset) }
    def clear_timezone_offset; end
  end

  class DataTimezone
    # RDL Type: ((TZInfo::Timestamp or Time)) -> XXX
    sig { params(time: T.any(Time, TZInfo::Timestamp)).returns(T.untyped) }
    def period_for(time); end

    # RDL Type: ((TZInfo::Timestamp or Time)) -> XXX
    sig { params(local_time: T.any(Time, TZInfo::Timestamp)).returns(T.untyped) }
    def periods_for_local(local_time); end

    # RDL Type: ((TZInfo::Timestamp or Time), ?((TZInfo::Timestamp or Time))) -> XXX
    sig { params(to: T.any(Time, TZInfo::Timestamp), from: T.any(Time, TZInfo::Timestamp)).returns(T.untyped) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> TZInfo::DataTimezone
    sig { returns(TZInfo::DataTimezone) }
    def canonical_zone; end
  end

  class InfoTimezone
    # RDL Type: ((TZInfo::DataSources::DataTimezoneInfo and [ identifier: () -> XXX ])) -> self
    sig { params(info: TZInfo::DataSources::DataTimezoneInfo).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def identifier; end

    # RDL Type: () -> TZInfo::DataSources::DataTimezoneInfo
    sig { returns(TZInfo::DataSources::DataTimezoneInfo) }
    def info; end
  end

  class TimezonePeriod
    # RDL Type: ((TZInfo::TimezoneOffset or TZInfo::TimezonePeriod)) -> self
    sig { params(offset: T.any(TZInfo::TimezonePeriod, TZInfo::TimezoneOffset)).returns(T.self_type) }
    def initialize(offset); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def start_transition; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def end_transition; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def base_utc_offset; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def std_offset; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def abbreviation; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def observed_utc_offset; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def dst?; end

    # RDL Type: () -> nil
    sig { void }
    def starts_at; end

    # RDL Type: () -> nil
    sig { void }
    def ends_at; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def local_starts_at; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def local_ends_at; end

    # RDL Type: (XXX) -> XXX
    sig { params(method_name: T.untyped).returns(T.untyped) }
    def raise_not_implemented(method_name); end

    # RDL Type: ([ at: () -> XXX ]) -> nil
    sig { params(transition: T.untyped).void }
    def timestamp(transition); end

    # RDL Type: ([ at: () -> XXX ]) -> TZInfo::TimestampWithOffset
    sig { params(transition: T.untyped).returns(TZInfo::TimestampWithOffset) }
    def timestamp_with_offset(transition); end
  end

  class DataSource
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end

    # RDL Type: (XXX) -> XXX
    sig { params(identifier: T.untyped).returns(T.untyped) }
    def get_timezone_info(identifier); end

    # RDL Type: () -> (XXX or XXX)
    sig { returns(T.untyped) }
    def timezone_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def data_timezone_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def linked_timezone_identifiers; end

    # RDL Type: (XXX) -> XXX
    sig { params(code: T.untyped).returns(T.untyped) }
    def get_country_info(code); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def country_codes; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end

    # RDL Type: (XXX) -> XXX
    sig { params(identifier: T.untyped).returns(T.untyped) }
    def load_timezone_info(identifier); end

    # RDL Type: (XXX) -> XXX
    sig { params(code: T.untyped).returns(T.untyped) }
    def load_country_info(code); end

    # RDL Type: () -> Encoding
    sig { returns(Encoding) }
    def timezone_identifier_encoding; end

    # RDL Type: (String) -> nil
    sig { params(identifier: String).void }
    def validate_timezone_identifier(identifier); end

    # RDL Type: ([ []: (XXX) -> XXX ], String, ?[ ==: (XXX) -> XXX ]) -> nil
    sig { params(hash: T.untyped, code: String, encoding: T.untyped).void }
    def lookup_country_info(hash, code, encoding = nil); end

    # RDL Type: (String) -> XXX
    sig { params(method_name: String).returns(T.untyped) }
    def raise_invalid_data_source(method_name); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def build_timezone_identifiers; end

    # RDL Type: (String, [ ==: (XXX) -> XXX ]) {(String) -> XXX} -> nil
    sig { params(string: String, encoding: T.untyped).void }
    def try_with_encoding(string, encoding); end
  end

  module DataSources
    class RubyDataSource
      # RDL Type: () -> String
      sig { returns(String) }
      def to_s; end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end

      # RDL Type: (String) -> nil
      sig { params(code: String).void }
      def load_country_info(code); end

      # RDL Type: (String) -> (false or true)
      sig { params(name: String).returns(T.any(FalseClass, TrueClass)) }
      def require_index(name); end

      # RDL Type: (*XXX) -> (false or true)
      sig { params(file: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def require_data(*file); end
    end

    class ZoneinfoReader
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: ((Pathname or [ to_str: () -> String ])) -> XXX
      sig { params(file_path: T.untyped).returns(T.untyped) }
      def read(file_path); end

      # RDL Type: (([ -: (Number) -> XXX ] and [ >=: (Number) -> XXX ])) -> ([ -: (Number) -> XXX ] and [ >=: (Number) -> XXX ])
      sig { params(long: T.untyped).returns(T.untyped) }
      def make_signed_int32(long); end

      # RDL Type: ([ <<: (Number) -> XXX ], XXX) -> XXX
      sig { params(high: T.untyped, low: T.untyped).returns(T.untyped) }
      def make_signed_int64(high, low); end

      # RDL Type: (([ path: () -> XXX ] and [ read: (XXX) -> XXX ]), XXX) -> XXX
      sig { params(file: T.untyped, bytes: T.untyped).returns(T.untyped) }
      def check_read(file, bytes); end

      # RDL Type: (([ each: () {(XXX) -> XXX} -> XXX ] and [ empty?: () -> XXX ] and [ reverse_each: () {(XXX) -> XXX} -> XXX ]), ([ <<: (XXX) -> XXX ] and [ []: (XXX) -> XXX ] and [ index: () {(XXX) -> XXX} -> XXX ] and [ length: () -> XXX ])) -> Number
      sig { params(transitions: T.untyped, offsets: T.untyped).returns(Integer) }
      def derive_offsets(transitions, offsets); end

      # RDL Type: (([ path: () -> XXX ] and [ read: (XXX) -> XXX ] and [ seek: (XXX, Number) -> XXX ])) -> XXX
      sig { params(file: T.untyped).returns(T.untyped) }
      def parse(file); end
    end

    class DataTimezoneInfo
      # RDL Type: (XXX) -> XXX
      sig { params(timestamp: T.untyped).returns(T.untyped) }
      def period_for(timestamp); end

      # RDL Type: (XXX) -> XXX
      sig { params(local_timestamp: T.untyped).returns(T.untyped) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (XXX, ?XXX) -> XXX
      sig { params(to_timestamp: T.untyped, from_timestamp: T.untyped).returns(T.untyped) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: () -> TZInfo::DataTimezone
      sig { returns(TZInfo::DataTimezone) }
      def create_timezone; end

      # RDL Type: (String) -> XXX
      sig { params(method_name: String).returns(T.untyped) }
      def raise_not_implemented(method_name); end
    end

    class ConstantOffsetDataTimezoneInfo
      # RDL Type: ([ freeze: () -> XXX ], XXX) -> self
      sig { params(identifier: T.untyped, constant_offset: T.untyped).returns(T.self_type) }
      def initialize(identifier, constant_offset); end

      # RDL Type: (XXX) -> TZInfo::OffsetTimezonePeriod
      sig { params(timestamp: T.untyped).returns(TZInfo::OffsetTimezonePeriod) }
      def period_for(timestamp); end

      # RDL Type: (XXX) -> [TZInfo::OffsetTimezonePeriod]
      sig { params(local_timestamp: T.untyped).returns(T::Array[TZInfo::OffsetTimezonePeriod]) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (XXX, ?XXX) -> Array<XXX>
      sig { params(to_timestamp: T.untyped, from_timestamp: T.untyped).returns(T::Array[T.untyped]) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: () -> TZInfo::OffsetTimezonePeriod
      sig { returns(TZInfo::OffsetTimezonePeriod) }
      def constant_period; end
    end

    class CountryInfo
      # RDL Type: ([ freeze: () -> XXX ], String, [ freeze: () -> XXX ]) -> self
      sig { params(code: T.untyped, name: String, zones: T.untyped).returns(T.self_type) }
      def initialize(code, name, zones); end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end
    end

    class TransitionsDataTimezoneInfo
      # RDL Type: ([ freeze: () -> XXX ], ([ empty?: () -> XXX ] and [ freeze: () -> XXX ])) -> self
      sig { params(identifier: T.untyped, transitions: T.untyped).returns(T.self_type) }
      def initialize(identifier, transitions); end

      # RDL Type: (TZInfo::Timestamp) -> TZInfo::TransitionsTimezonePeriod
      sig { params(timestamp: TZInfo::Timestamp).returns(TZInfo::TransitionsTimezonePeriod) }
      def period_for(timestamp); end

      # RDL Type: (TZInfo::Timestamp) -> Array<TZInfo::TransitionsTimezonePeriod>
      sig { params(local_timestamp: TZInfo::Timestamp).returns(T::Array[TZInfo::TransitionsTimezonePeriod]) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (TZInfo::Timestamp, ?TZInfo::Timestamp) -> Array<XXX>
      sig { params(to_timestamp: TZInfo::Timestamp, from_timestamp: TZInfo::Timestamp).returns(T::Array[T.untyped]) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: (TZInfo::TimezoneTransition, TZInfo::Timestamp) -> (false or true)
      sig { params(transition: TZInfo::TimezoneTransition, timestamp: TZInfo::Timestamp).returns(T.any(FalseClass, TrueClass)) }
      def transition_on_or_after_timestamp?(transition, timestamp); end
    end

    class TimezoneInfo
      # RDL Type: ([ freeze: () -> XXX ]) -> self
      sig { params(identifier: T.untyped).returns(T.self_type) }
      def initialize(identifier); end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def create_timezone; end

      # RDL Type: (String) -> XXX
      sig { params(method_name: String).returns(T.untyped) }
      def raise_not_implemented(method_name); end
    end

    class LinkedTimezoneInfo
      # RDL Type: ([ freeze: () -> XXX ], [ freeze: () -> XXX ]) -> self
      sig { params(identifier: T.untyped, link_to_identifier: T.untyped).returns(T.self_type) }
      def initialize(identifier, link_to_identifier); end

      # RDL Type: () -> TZInfo::LinkedTimezone
      sig { returns(TZInfo::LinkedTimezone) }
      def create_timezone; end
    end
  end

  module Format1
    class CountryDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(identifier_deduper, description_deduper); end
    end

    class TimezoneDefiner
      # RDL Type: (Number, [ +: (XXX) -> XXX ], Number, [ to_s: () -> String ]) -> TZInfo::TimezoneOffset
      sig do
        params(
          id: Integer,
          utc_offset: T.untyped,
          std_offset: Integer,
          abbreviation: T.untyped
        ).returns(TZInfo::TimezoneOffset)
      end
      def offset(id, utc_offset, std_offset, abbreviation); end

      # RDL Type: (XXX, XXX, Number, XXX, ?XXX, ?[ !: () -> XXX ]) -> XXX
      sig do
        params(
          year: T.untyped,
          month: T.untyped,
          offset_id: Integer,
          timestamp_value: T.untyped,
          datetime_numerator: T.untyped,
          datetime_denominator: T.untyped
        ).returns(T.untyped)
      end
      def transition(year, month, offset_id, timestamp_value, datetime_numerator = nil, datetime_denominator = nil); end
    end
  end

  module Format2
    class CountryDefiner
      # RDL Type: (Hash<XXX, TZInfo::CountryTimezone>, [ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(shared_timezones: T::Hash[T.untyped, TZInfo::CountryTimezone], identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(shared_timezones, identifier_deduper, description_deduper); end

      # RDL Type: (XXX, ?Numeric, ?Numeric, ?Numeric, ?Numeric, ?[ freeze: () -> XXX ]) -> XXX
      sig do
        params(
          identifier_or_reference: T.untyped,
          latitude_numerator: Numeric,
          latitude_denominator: Numeric,
          longitude_numerator: Numeric,
          longitude_denominator: Numeric,
          description: T.untyped
        ).returns(T.untyped)
      end
      def timezone(identifier_or_reference, latitude_numerator = nil, latitude_denominator = nil, longitude_numerator = nil, longitude_denominator = nil, description = nil); end
    end

    class TimezoneDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: () -> XXX
      sig { returns(T.untyped) }
      def first_offset; end

      # RDL Type: (Number, [ +: (XXX) -> XXX ], Number, [ freeze: () -> XXX ]) -> TZInfo::TimezoneOffset
      sig do
        params(
          id: Integer,
          base_utc_offset: T.untyped,
          std_offset: Integer,
          abbreviation: T.untyped
        ).returns(TZInfo::TimezoneOffset)
      end
      def offset(id, base_utc_offset, std_offset, abbreviation); end

      # RDL Type: (Number, XXX) -> XXX
      sig { params(offset_id: Integer, timestamp_value: T.untyped).returns(T.untyped) }
      def transition(offset_id, timestamp_value); end

      # RDL Type: (*XXX) -> nil
      sig { params(args: T.untyped).void }
      def subsequent_rules(*args); end
    end

    class CountryIndexDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(identifier_deduper, description_deduper); end

      # RDL Type: (XXX, XXX, Numeric, Numeric, Numeric, Numeric, ?[ freeze: () -> XXX ]) -> XXX
      sig do
        params(
          reference: T.untyped,
          identifier: T.untyped,
          latitude_numerator: Numeric,
          latitude_denominator: Numeric,
          longitude_numerator: Numeric,
          longitude_denominator: Numeric,
          description: T.untyped
        ).returns(T.untyped)
      end
      def timezone(reference, identifier, latitude_numerator, latitude_denominator, longitude_numerator, longitude_denominator, description = nil); end

      # RDL Type: ([ freeze: () -> XXX ], String) {(TZInfo::Format2::CountryDefiner) -> XXX} -> XXX
      sig { params(code: T.untyped, name: String).returns(T.untyped) }
      def country(code, name); end
    end

    class TimezoneIndexDefiner
      # RDL Type: ((TZInfo::StringDeduper or TZInfo::UnaryMinusGlobalStringDeduper)) -> self
      sig { params(string_deduper: T.any(TZInfo::UnaryMinusGlobalStringDeduper, TZInfo::StringDeduper)).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: (XXX) -> XXX
      sig { params(identifier: T.untyped).returns(T.untyped) }
      def data_timezone(identifier); end

      # RDL Type: (XXX) -> XXX
      sig { params(identifier: T.untyped).returns(T.untyped) }
      def linked_timezone(identifier); end
    end
  end
end

class [s]TZInfo
  class Timezone
    # RDL Type: (([ !: () -> XXX ] and [ nil?: () -> XXX ])) -> nil
    sig { params(value: T.untyped).void }
    def default_dst=(value); end

    # RDL Type: () -> nil
    sig { void }
    def default_dst; end

    # RDL Type: (XXX) -> XXX
    sig { params(identifier: T.untyped).returns(T.untyped) }
    def get(identifier); end

    # RDL Type: (XXX) -> TZInfo::TimezoneProxy
    sig { params(identifier: T.untyped).returns(TZInfo::TimezoneProxy) }
    def get_proxy(identifier); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_data_zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_data_zone_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_linked_zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_linked_zone_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_country_zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_country_zone_identifiers; end

    # RDL Type: ([ collect: () {(XXX) -> XXX} -> XXX ]) -> XXX
    sig { params(identifiers: T.untyped).returns(T.untyped) }
    def get_proxies(identifiers); end

    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def data_source; end

    # RDL Type: (XXX) -> XXX
    sig { params(data: T.untyped).returns(T.untyped) }
    def _load(data); end
  end

  class TimezoneProxy
    # RDL Type: (XXX) -> TZInfo::TimezoneProxy
    sig { params(data: T.untyped).returns(TZInfo::TimezoneProxy) }
    def _load(data); end
  end

  class Timestamp
    # RDL Type: (Number, ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?Number, ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ kind_of?: (Class) -> XXX ]) -> TZInfo::Timestamp
    sig do
      params(
        year: Integer,
        month: T.untyped,
        day: Integer,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        utc_offset: T.untyped
      ).returns(TZInfo::Timestamp)
    end
    def create(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, utc_offset = nil); end

    # RDL Type: ((TZInfo::Timestamp or Time), ?XXX) {((XXX or XXX or XXX or XXX)) -> TZInfo::Timestamp} -> TZInfo::Timestamp
    sig { params(value: T.any(Time, TZInfo::Timestamp), offset: T.untyped).returns(TZInfo::Timestamp) }
    def for(value, offset = nil); end

    # RDL Type: (XXX, ?XXX) -> TZInfo::Timestamp
    sig { params(value: T.untyped, sub_second: T.untyped).returns(TZInfo::Timestamp) }
    def utc(value, sub_second = nil); end

    # RDL Type: (XXX, ?XXX, ?XXX) -> TZInfo::Timestamp
    sig { params(value: T.untyped, sub_second: T.untyped, utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def new!(value, sub_second = nil, utc_offset = nil); end

    # RDL Type: (Time, XXX, XXX) -> TZInfo::Timestamp
    sig { params(time: Time, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_time(time, ignore_offset, target_utc_offset); end

    # RDL Type: (DateTime, XXX, XXX) -> TZInfo::Timestamp
    sig { params(datetime: DateTime, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_datetime(datetime, ignore_offset, target_utc_offset); end

    # RDL Type: (TZInfo::Timestamp, XXX, [ ==: (:utc) -> XXX ]) -> TZInfo::Timestamp
    sig { params(timestamp: TZInfo::Timestamp, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_timestamp(timestamp, ignore_offset, target_utc_offset); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ])) -> (false or true)
    sig { params(value: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def is_time_like?(value); end

    # RDL Type: ((TZInfo::Timestamp or Time), XXX, XXX) -> TZInfo::Timestamp
    sig { params(time_like: T.any(Time, TZInfo::Timestamp), ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_time_like(time_like, ignore_offset, target_utc_offset); end
  end

  class TimestampWithOffset
    # RDL Type: (TZInfo::Timestamp, (TZInfo::Timezone or TZInfo::TimezoneOffset or TZInfo::TimezonePeriod)) -> TZInfo::TimestampWithOffset
    sig { params(timestamp: TZInfo::Timestamp, timezone_offset: T.any(TZInfo::Timezone, TZInfo::TimezonePeriod, TZInfo::TimezoneOffset)).returns(TZInfo::TimestampWithOffset) }
    def set_timezone_offset(timestamp, timezone_offset); end
  end

  class Country
    # RDL Type: (XXX) -> TZInfo::Country
    sig { params(code: T.untyped).returns(TZInfo::Country) }
    def get(code); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_codes; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all; end

    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def data_source; end

    # RDL Type: (XXX) -> TZInfo::Country
    sig { params(data: T.untyped).returns(TZInfo::Country) }
    def _load(data); end
  end

  class DataSource
    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def get; end

    # RDL Type: ((TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource), *XXX) -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { params(data_source_or_type: T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource), args: T.untyped).returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def set(data_source_or_type, *args); end

    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def create_default_data_source; end
  end
end
