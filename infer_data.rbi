# typed: strong
module TZInfo
  class TimezoneTransition
    # RDL Type: (TZInfo::TimezoneOffset, TZInfo::TimezoneOffset, XXX) -> self
    sig { params(offset: TZInfo::TimezoneOffset, previous_offset: TZInfo::TimezoneOffset, timestamp_value: T.untyped).returns(T.self_type) }
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

    # RDL Type: (([ kind_of?: (Class) -> XXX ] and [ offset: () -> XXX ] and [ previous_offset: () -> XXX ] and [ timestamp_value: () -> XXX ])) -> (false or true)
    sig { params(tti: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(tti); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end
  end

  class DataSource
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end

    # RDL Type: (XXX) -> XXX
    sig { params(identifier: T.untyped).returns(T.untyped) }
    def get_timezone_info(identifier); end

    # RDL Type: () -> XXX
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

    # RDL Type: (([ encode: (Encoding) -> XXX ] and [ encoding: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ nil?: () -> XXX ])) -> nil
    sig { params(identifier: T.untyped).void }
    def validate_timezone_identifier(identifier); end

    # RDL Type: ([ []: (XXX) -> XXX ], ([ encode: (Encoding) -> XXX ] and [ encoding: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ nil?: () -> XXX ]), ?[ ==: (XXX) -> (false or true) ]) -> nil
    sig { params(hash: T.untyped, code: T.untyped, encoding: T.untyped).void }
    def lookup_country_info(hash, code, encoding = nil); end

    # RDL Type: (XXX) -> XXX
    sig { params(method_name: T.untyped).returns(T.untyped) }
    def raise_invalid_data_source(method_name); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def build_timezone_identifiers; end

    # RDL Type: (([ encode: (XXX) -> XXX ] and [ encoding: () -> XXX ]), [ ==: (XXX) -> (false or true) ]) {(([ encode: (XXX) -> XXX ] and [ encoding: () -> XXX ])) -> XXX} -> nil
    sig { params(string: T.untyped, encoding: T.untyped).void }
    def try_with_encoding(string, encoding); end
  end

  class StringDeduper
    # RDL Type: () -> self
    sig { returns(T.self_type) }
    def initialize; end

    # RDL Type: (%any) -> %any
    sig { params(string: T.nilable(BasicObject)).returns(T.nilable(BasicObject)) }
    def dedupe(string); end

    # RDL Type: () {XXX} -> Hash<%any, %any>
    sig { returns(T::Hash[T.nilable(BasicObject), T.nilable(BasicObject)]) }
    def create_hash; end
  end

  class ConcurrentStringDeduper
    # RDL Type: () {XXX} -> Concurrent::Map
    sig { returns(Concurrent::Map) }
    def create_hash; end
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

    # RDL Type: (([ kind_of?: (Class) -> XXX ] and [ offset: () -> XXX ])) -> (false or true)
    sig { params(p: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(p); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def hash; end
  end

  class TimestampWithOffset
    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::TimestampWithOffset
    sig { params(timezone_offset: TZInfo::TimezoneOffset).returns(TZInfo::TimestampWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_time; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def to_datetime; end
  end

  class Country
    # RDL Type: (([ code: () -> XXX ] and [ name: () -> XXX ] and [ zones: () -> XXX ])) -> self
    sig { params(info: T.untyped).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def code; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def name; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
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

    # RDL Type: (([ code: () -> XXX ] and [ is_a?: (Class) -> XXX ])) -> nil
    sig { params(c: T.untyped).void }
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

  class LinkedTimezone
    # RDL Type: ([ link_to_identifier: () -> XXX ]) -> self
    sig { params(info: T.untyped).returns(T.self_type) }
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

  class TimeWithOffset
    # RDL Type: ([ observed_utc_offset: () -> XXX ]) -> TZInfo::TimeWithOffset
    sig { params(timezone_offset: T.untyped).returns(TZInfo::TimeWithOffset) }
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

  class InfoTimezone
    # RDL Type: ((TZInfo::DataSources::DataTimezoneInfo and [ periods_for_local: (XXX) -> XXX ] and [ transitions_up_to: (XXX, (XXX or XXX)) -> XXX ])) -> self
    sig { params(info: T.untyped).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def identifier; end

    # RDL Type: () -> TZInfo::DataSources::DataTimezoneInfo
    sig { returns(TZInfo::DataSources::DataTimezoneInfo) }
    def info; end
  end

  class TimezonePeriod
    # RDL Type: (([ abbreviation: () -> XXX ] and [ base_utc_offset: () -> XXX ] and [ dst?: () -> XXX ] and [ observed_utc_offset: () -> XXX ] and [ std_offset: () -> XXX ])) -> self
    sig { params(offset: T.untyped).returns(T.self_type) }
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

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
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

  class Timezone
    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def identifier; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
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

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> XXX
    sig { params(utc_time: T.untyped).returns(T.untyped) }
    def period_for_utc(utc_time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ strftime: (String) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?[ nil?: () -> XXX ]) {((XXX or XXX)) -> XXX} -> XXX
    sig { params(local_time: T.untyped, dst: T.untyped).returns(T.untyped) }
    def period_for_local(local_time, dst = nil); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::Timestamp
    sig { params(time: T.untyped).returns(TZInfo::Timestamp) }
    def to_local(time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::Timestamp
    sig { params(utc_time: T.untyped).returns(TZInfo::Timestamp) }
    def utc_to_local(utc_time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?[ nil?: () -> XXX ]) {(XXX) -> XXX} -> TZInfo::Timestamp
    sig { params(local_time: T.untyped, dst: T.untyped).returns(TZInfo::Timestamp) }
    def local_to_utc(local_time, dst = nil); end

    # RDL Type: (([ -: (Number) -> XXX ] and [ /: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?(Number and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ nil?: () -> XXX ]) {XXX} -> XXX
    sig do
      params(
        year: T.untyped,
        month: T.untyped,
        day: T.untyped,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        dst: T.untyped
      ).returns(T.untyped)
    end
    def local_time(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: (([ -: (Number) -> XXX ] and [ /: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?(Number and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ nil?: () -> XXX ]) {XXX} -> XXX
    sig do
      params(
        year: T.untyped,
        month: T.untyped,
        day: T.untyped,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        dst: T.untyped
      ).returns(T.untyped)
    end
    def local_datetime(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: (([ -: (Number) -> XXX ] and [ /: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?(Number and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ nil?: () -> XXX ]) {XXX} -> TZInfo::TimestampWithOffset
    sig do
      params(
        year: T.untyped,
        month: T.untyped,
        day: T.untyped,
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

    # RDL Type: (XXX, ?([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> XXX
    sig { params(format: T.untyped, time: T.untyped).returns(T.untyped) }
    def strftime(format, time = nil); end

    # RDL Type: (?XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def abbreviation(time = nil); end

    # RDL Type: (?XXX) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
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

    # RDL Type: () -> nil
    sig { void }
    def real_timezone; end
  end

  class CountryTimezone
    # RDL Type: ([ freeze: () -> XXX ], Number, Number, ?[ freeze: () -> XXX ]) -> self
    sig do
      params(
        identifier: T.untyped,
        latitude: Integer,
        longitude: Integer,
        description: T.untyped
      ).returns(T.self_type)
    end
    def initialize(identifier, latitude, longitude, description = nil); end

    # RDL Type: () -> TZInfo::TimezoneProxy
    sig { returns(TZInfo::TimezoneProxy) }
    def timezone; end

    # RDL Type: () -> String
    sig { returns(String) }
    def description_or_friendly_identifier; end

    # RDL Type: (([ description: () -> XXX ] and [ identifier: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ latitude: () -> XXX ] and [ longitude: () -> XXX ])) -> (false or true)
    sig { params(ct: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(ct); end

    # RDL Type: (([ description: () -> XXX ] and [ identifier: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ latitude: () -> XXX ] and [ longitude: () -> XXX ])) -> (false or true)
    sig { params(ct: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def eql?(ct); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end
  end

  class DateTimeWithOffset
    # RDL Type: ([ observed_utc_offset: () -> XXX ]) -> TZInfo::DateTimeWithOffset
    sig { params(timezone_offset: T.untyped).returns(TZInfo::DateTimeWithOffset) }
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

  class TimezoneOffset
    # RDL Type: ([ +: (XXX) -> XXX ], Number, [ freeze: () -> XXX ]) -> self
    sig { params(base_utc_offset: T.untyped, std_offset: Integer, abbreviation: T.untyped).returns(T.self_type) }
    def initialize(base_utc_offset, std_offset, abbreviation); end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def dst?; end

    # RDL Type: (([ abbreviation: () -> XXX ] and [ base_utc_offset: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ std_offset: () -> XXX ])) -> (false or true)
    sig { params(toi: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(toi); end

    # RDL Type: (([ abbreviation: () -> XXX ] and [ base_utc_offset: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ std_offset: () -> XXX ])) -> (false or true)
    sig { params(toi: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def eql?(toi); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end
  end

  class Timestamp
    # RDL Type: () -> (false or nil or true)
    sig { returns(T.any(FalseClass, NilClass, TrueClass)) }
    def utc?; end

    # RDL Type: (([ ==: (Number) -> (false or true) ] and [ kind_of?: (Class) -> XXX ]), ([ !=: (:utc) -> XXX ] and [ ==: ((:utc or XXX)) -> (false or true) ] and [ kind_of?: (Class) -> XXX ])) -> Object
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

    # RDL Type: (([ kind_of?: (Class) -> XXX ] and [ sub_second: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> nil
    sig { params(t: T.untyped).void }
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

    # RDL Type: (([ +: (XXX) -> XXX ] and [ to_r: () -> XXX ]), ?(Number and [ denominator: () -> XXX ] and [ numerator: () -> XXX ]), ?(Number and [ !=: (Number) -> XXX ] and [ ==: (:utc) -> (false or true) ] and [ >=: (Number) -> XXX ] and [ abs: () -> XXX ] and [ inspect: () -> XXX ])) -> Number
    sig { params(value: T.untyped, sub_second: T.untyped, utc_offset: T.untyped).returns(Integer) }
    def initialize!(value, sub_second = nil, utc_offset = nil); end
  end

  class TransitionsTimezonePeriod
    # RDL Type: (TZInfo::TimezoneTransition, ([ inspect: () -> XXX ] and [ previous_offset: () -> XXX ])) -> self
    sig { params(start_transition: TZInfo::TimezoneTransition, end_transition: T.untyped).returns(T.self_type) }
    def initialize(start_transition, end_transition); end

    # RDL Type: (([ end_transition: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ start_transition: () -> XXX ])) -> (false or true)
    sig { params(p: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(p); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end
  end

  class DataTimezone
    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> XXX
    sig { params(time: T.untyped).returns(T.untyped) }
    def period_for(time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> XXX
    sig { params(local_time: T.untyped).returns(T.untyped) }
    def periods_for_local(local_time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> XXX
    sig { params(to: T.untyped, from: T.untyped).returns(T.untyped) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> TZInfo::DataTimezone
    sig { returns(TZInfo::DataTimezone) }
    def canonical_zone; end
  end

  module DataSources
    class RubyDataSource
      # RDL Type: () -> String
      sig { returns(String) }
      def to_s; end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end

      # RDL Type: (([ encode: (Encoding) -> XXX ] and [ encoding: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ nil?: () -> XXX ])) -> nil
      sig { params(code: T.untyped).void }
      def load_country_info(code); end

      # RDL Type: ((Array<String> or File or Pathname or [ to_str: () -> String ])) -> (false or true)
      sig { params(name: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def require_index(name); end

      # RDL Type: (*XXX) -> (false or true)
      sig { params(file: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def require_data(*file); end
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

      # RDL Type: (XXX) -> XXX
      sig { params(method_name: T.untyped).returns(T.untyped) }
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
      # RDL Type: ([ freeze: () -> XXX ], [ freeze: () -> XXX ], [ freeze: () -> XXX ]) -> self
      sig { params(code: T.untyped, name: T.untyped, zones: T.untyped).returns(T.self_type) }
      def initialize(code, name, zones); end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end
    end

    class TransitionsDataTimezoneInfo
      # RDL Type: ([ freeze: () -> XXX ], ([ empty?: () -> XXX ] and [ freeze: () -> XXX ])) -> self
      sig { params(identifier: T.untyped, transitions: T.untyped).returns(T.self_type) }
      def initialize(identifier, transitions); end

      # RDL Type: (([ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> TZInfo::TransitionsTimezonePeriod
      sig { params(timestamp: T.untyped).returns(TZInfo::TransitionsTimezonePeriod) }
      def period_for(timestamp); end

      # RDL Type: (([ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> Array<TZInfo::TransitionsTimezonePeriod>
      sig { params(local_timestamp: T.untyped).returns(T::Array[TZInfo::TransitionsTimezonePeriod]) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (([ <=: (XXX) -> XXX ] and [ sub_second: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ]), ?([ sub_second: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> Array<XXX>
      sig { params(to_timestamp: T.untyped, from_timestamp: T.untyped).returns(T::Array[T.untyped]) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: ([ timestamp_value: () -> XXX ], ([ sub_second: () -> XXX ] and [ value: () -> XXX ])) -> (false or true)
      sig { params(transition: T.untyped, timestamp: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def transition_on_or_after_timestamp?(transition, timestamp); end
    end

    class ZoneinfoReader
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: ((Pathname or [ to_str: () -> String ])) -> XXX
      sig { params(file_path: T.untyped).returns(T.untyped) }
      def read(file_path); end

      # RDL Type: (([ -: (Number) -> XXX ] and [ >=: (Number) -> XXX ])) -> XXX
      sig { params(long: T.untyped).returns(T.untyped) }
      def make_signed_int32(long); end

      # RDL Type: ([ <<: (Number) -> XXX ], XXX) -> XXX
      sig { params(high: T.untyped, low: T.untyped).returns(T.untyped) }
      def make_signed_int64(high, low); end

      # RDL Type: (([ path: () -> XXX ] and [ read: (XXX) -> XXX ]), Number) -> String
      sig { params(file: T.untyped, bytes: Integer).returns(String) }
      def check_read(file, bytes); end

      # RDL Type: (([ each: () {(XXX) -> XXX} -> XXX ] and [ empty?: () -> XXX ] and [ reverse_each: () {(XXX) -> XXX} -> XXX ]), ([ <<: (XXX) -> XXX ] and [ []: (XXX) -> XXX ] and [ index: () {(XXX) -> XXX} -> XXX ] and [ length: () -> XXX ])) -> Number
      sig { params(transitions: T.untyped, offsets: T.untyped).returns(Integer) }
      def derive_offsets(transitions, offsets); end

      # RDL Type: (([ path: () -> XXX ] and [ read: (XXX) -> XXX ] and [ seek: (XXX, Number) -> XXX ])) -> XXX
      sig { params(file: T.untyped).returns(T.untyped) }
      def parse(file); end
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

      # RDL Type: (XXX) -> XXX
      sig { params(method_name: T.untyped).returns(T.untyped) }
      def raise_not_implemented(method_name); end
    end
  end

  module Format1
    class CountryDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(identifier_deduper, description_deduper); end
    end

    class TimezoneDefiner
      # RDL Type: (XXX, [ +: (XXX) -> XXX ], Number, [ to_s: () -> String ]) -> TZInfo::TimezoneOffset
      sig do
        params(
          id: T.untyped,
          utc_offset: T.untyped,
          std_offset: Integer,
          abbreviation: T.untyped
        ).returns(TZInfo::TimezoneOffset)
      end
      def offset(id, utc_offset, std_offset, abbreviation); end

      # RDL Type: (XXX, XXX, XXX, XXX, ?XXX, ?[ !: () -> XXX ]) -> TZInfo::TimezoneOffset
      sig do
        params(
          year: T.untyped,
          month: T.untyped,
          offset_id: T.untyped,
          timestamp_value: T.untyped,
          datetime_numerator: T.untyped,
          datetime_denominator: T.untyped
        ).returns(TZInfo::TimezoneOffset)
      end
      def transition(year, month, offset_id, timestamp_value, datetime_numerator = nil, datetime_denominator = nil); end
    end
  end

  module Format2
    class CountryIndexDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(identifier_deduper, description_deduper); end

      # RDL Type: (XXX, XXX, Number, Number, Number, Number, ?[ freeze: () -> XXX ]) -> TZInfo::CountryTimezone
      sig do
        params(
          reference: T.untyped,
          identifier: T.untyped,
          latitude_numerator: Integer,
          latitude_denominator: Integer,
          longitude_numerator: Integer,
          longitude_denominator: Integer,
          description: T.untyped
        ).returns(TZInfo::CountryTimezone)
      end
      def timezone(reference, identifier, latitude_numerator, latitude_denominator, longitude_numerator, longitude_denominator, description = nil); end

      # RDL Type: ([ freeze: () -> XXX ], [ freeze: () -> XXX ]) {(TZInfo::Format2::CountryDefiner) -> XXX} -> TZInfo::DataSources::CountryInfo
      sig { params(code: T.untyped, name: T.untyped).returns(TZInfo::DataSources::CountryInfo) }
      def country(code, name); end
    end

    class CountryDefiner
      # RDL Type: (Hash<XXX, TZInfo::CountryTimezone>, [ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(shared_timezones: T::Hash[T.untyped, TZInfo::CountryTimezone], identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(shared_timezones, identifier_deduper, description_deduper); end

      # RDL Type: (XXX, ?Number, ?Number, ?Number, ?Number, ?[ freeze: () -> XXX ]) -> Array<TZInfo::CountryTimezone>
      sig do
        params(
          identifier_or_reference: T.untyped,
          latitude_numerator: Integer,
          latitude_denominator: Integer,
          longitude_numerator: Integer,
          longitude_denominator: Integer,
          description: T.untyped
        ).returns(T::Array[TZInfo::CountryTimezone])
      end
      def timezone(identifier_or_reference, latitude_numerator = nil, latitude_denominator = nil, longitude_numerator = nil, longitude_denominator = nil, description = nil); end
    end

    class TimezoneIndexDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: (XXX) -> Array<XXX>
      sig { params(identifier: T.untyped).returns(T::Array[T.untyped]) }
      def data_timezone(identifier); end

      # RDL Type: (XXX) -> Array<XXX>
      sig { params(identifier: T.untyped).returns(T::Array[T.untyped]) }
      def linked_timezone(identifier); end
    end

    class TimezoneDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: () -> (TZInfo::TimezoneOffset or [XXX, XXX])
      sig { returns(T.any(TZInfo::TimezoneOffset, T::Array[T.untyped])) }
      def first_offset; end

      # RDL Type: (XXX, [ +: (XXX) -> XXX ], Number, [ freeze: () -> XXX ]) -> TZInfo::TimezoneOffset
      sig do
        params(
          id: T.untyped,
          base_utc_offset: T.untyped,
          std_offset: Integer,
          abbreviation: T.untyped
        ).returns(TZInfo::TimezoneOffset)
      end
      def offset(id, base_utc_offset, std_offset, abbreviation); end

      # RDL Type: (XXX, XXX) -> TZInfo::TimezoneOffset
      sig { params(offset_id: T.untyped, timestamp_value: T.untyped).returns(TZInfo::TimezoneOffset) }
      def transition(offset_id, timestamp_value); end

      # RDL Type: (*XXX) -> nil
      sig { params(args: T.untyped).void }
      def subsequent_rules(*args); end
    end
  end
end

class [s]TZInfo
  class DataSource
    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def get; end

    # RDL Type: (((TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource) and [ country_codes: () -> XXX ] and [ data_timezone_identifiers: () -> XXX ] and [ get_country_info: (XXX) -> XXX ] and [ get_timezone_info: (XXX) -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ linked_timezone_identifiers: () -> XXX ] and [ timezone_identifiers: () -> XXX ]), *XXX) -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { params(data_source_or_type: T.untyped, args: T.untyped).returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def set(data_source_or_type, *args); end

    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def create_default_data_source; end
  end

  class TimestampWithOffset
    # RDL Type: (([ sub_second: () -> XXX ] and [ value: () -> XXX ]), TZInfo::TimezoneOffset) -> TZInfo::TimestampWithOffset
    sig { params(timestamp: T.untyped, timezone_offset: TZInfo::TimezoneOffset).returns(TZInfo::TimestampWithOffset) }
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
    # RDL Type: (([ -: (Number) -> XXX ] and [ /: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ +: (Number) -> XXX ] and [ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?(Number and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?([ <: (Number) -> XXX ] and [ >: (Number) -> XXX ] and [ kind_of?: (Class) -> XXX ]), ?XXX, ?[ kind_of?: (Class) -> XXX ]) -> TZInfo::Timestamp
    sig do
      params(
        year: T.untyped,
        month: T.untyped,
        day: T.untyped,
        hour: T.untyped,
        minute: T.untyped,
        second: T.untyped,
        sub_second: T.untyped,
        utc_offset: T.untyped
      ).returns(TZInfo::Timestamp)
    end
    def create(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, utc_offset = nil); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?XXX) {((XXX or XXX or XXX or XXX)) -> Object} -> TZInfo::Timestamp
    sig { params(value: T.untyped, offset: T.untyped).returns(TZInfo::Timestamp) }
    def for(value, offset = nil); end

    # RDL Type: (XXX, ?XXX) -> TZInfo::Timestamp
    sig { params(value: T.untyped, sub_second: T.untyped).returns(TZInfo::Timestamp) }
    def utc(value, sub_second = nil); end

    # RDL Type: (XXX, ?XXX, ?XXX) -> TZInfo::Timestamp
    sig { params(value: T.untyped, sub_second: T.untyped, utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def new!(value, sub_second = nil, utc_offset = nil); end

    # RDL Type: (([ subsec: () -> XXX ] and [ to_i: () -> Number ] and [ utc?: () -> XXX ] and [ utc_offset: () -> XXX ]), XXX, XXX) -> TZInfo::Timestamp
    sig { params(time: T.untyped, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_time(time, ignore_offset, target_utc_offset); end

    # RDL Type: (([ hour: () -> XXX ] and [ jd: () -> XXX ] and [ min: () -> XXX ] and [ offset: () -> XXX ] and [ sec: () -> XXX ] and [ sec_fraction: () -> XXX ]), XXX, XXX) -> TZInfo::Timestamp
    sig { params(datetime: T.untyped, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_datetime(datetime, ignore_offset, target_utc_offset); end

    # RDL Type: ((TZInfo::Timestamp and [ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ strftime: (String) -> XXX ] and [ sub_second: () -> XXX ] and [ to_i: () -> Number ] and [ utc?: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ]), XXX, [ ==: (:utc) -> (false or true) ]) -> TZInfo::Timestamp
    sig { params(timestamp: T.untyped, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_timestamp(timestamp, ignore_offset, target_utc_offset); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ])) -> (false or true)
    sig { params(value: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def is_time_like?(value); end

    # RDL Type: (([ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), XXX, XXX) -> TZInfo::Timestamp
    sig { params(time_like: T.untyped, ignore_offset: T.untyped, target_utc_offset: T.untyped).returns(TZInfo::Timestamp) }
    def for_time_like(time_like, ignore_offset, target_utc_offset); end
  end
end
