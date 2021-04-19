# typed: strong
module TZInfo
  class CountryTimezone
    # RDL Type: (TZInfo::TimezoneOffset, Number, Number, ?TZInfo::TimezoneOffset) -> self
    sig do
      params(
        identifier: TZInfo::TimezoneOffset,
        latitude: Integer,
        longitude: Integer,
        description: TZInfo::TimezoneOffset
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

  class LinkedTimezone
    # RDL Type: ([ link_to_identifier: () -> XXX ]) -> self
    sig { params(info: T.untyped).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: (Number) -> TZInfo::TransitionsTimezonePeriod
    sig { params(time: Integer).returns(TZInfo::TransitionsTimezonePeriod) }
    def period_for(time); end

    # RDL Type: (Number) -> Array<XXX>
    sig { params(local_time: Integer).returns(T::Array[T.untyped]) }
    def periods_for_local(local_time); end

    # RDL Type: (TZInfo::TimezoneOffset, ?TZInfo::TimezoneOffset) -> Array<XXX>
    sig { params(to: TZInfo::TimezoneOffset, from: TZInfo::TimezoneOffset).returns(T::Array[T.untyped]) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def canonical_zone; end
  end

  class TransitionsTimezonePeriod
    # RDL Type: (TZInfo::TimezoneTransition, TZInfo::TimezoneTransition) -> self
    sig { params(start_transition: TZInfo::TimezoneTransition, end_transition: TZInfo::TimezoneTransition).returns(T.self_type) }
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

  class TimezoneOffset
    # RDL Type: (Number, Number, String) -> self
    sig { params(base_utc_offset: Integer, std_offset: Integer, abbreviation: String).returns(T.self_type) }
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

  class Timezone
    # RDL Type: () -> String
    sig { returns(String) }
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

    # RDL Type: (XXX) -> TZInfo::OffsetTimezonePeriod
    sig { params(time: T.untyped).returns(TZInfo::OffsetTimezonePeriod) }
    def period_for(time); end

    # RDL Type: (XXX) -> XXX
    sig { params(local_time: T.untyped).returns(T.untyped) }
    def periods_for_local(local_time); end

    # RDL Type: (TZInfo::TimezoneOffset, ?TZInfo::TimezoneOffset) -> String
    sig { params(to: TZInfo::TimezoneOffset, from: TZInfo::TimezoneOffset).returns(String) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def canonical_zone; end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::OffsetTimezonePeriod
    sig { params(utc_time: T.untyped).returns(TZInfo::OffsetTimezonePeriod) }
    def period_for_utc(utc_time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ strftime: (String) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?Array<TZInfo::CountryTimezone>) {((XXX or XXX)) -> XXX} -> TZInfo::OffsetTimezonePeriod
    sig { params(local_time: T.untyped, dst: T::Array[TZInfo::CountryTimezone]).returns(TZInfo::OffsetTimezonePeriod) }
    def period_for_local(local_time, dst = nil); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::Timestamp
    sig { params(time: T.untyped).returns(TZInfo::Timestamp) }
    def to_local(time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::Timestamp
    sig { params(utc_time: T.untyped).returns(TZInfo::Timestamp) }
    def utc_to_local(utc_time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?Array<TZInfo::CountryTimezone>) {(XXX) -> XXX} -> TZInfo::Timestamp
    sig { params(local_time: T.untyped, dst: T::Array[TZInfo::CountryTimezone]).returns(TZInfo::Timestamp) }
    def local_to_utc(local_time, dst = nil); end

    # RDL Type: (Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Array<TZInfo::CountryTimezone>) {XXX} -> String
    sig do
      params(
        year: Integer,
        month: Integer,
        day: Integer,
        hour: Integer,
        minute: Integer,
        second: Integer,
        sub_second: Integer,
        dst: T::Array[TZInfo::CountryTimezone]
      ).returns(String)
    end
    def local_time(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: (Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Array<TZInfo::CountryTimezone>) {XXX} -> String
    sig do
      params(
        year: Integer,
        month: Integer,
        day: Integer,
        hour: Integer,
        minute: Integer,
        second: Integer,
        sub_second: Integer,
        dst: T::Array[TZInfo::CountryTimezone]
      ).returns(String)
    end
    def local_datetime(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: (Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Array<TZInfo::CountryTimezone>) {XXX} -> TZInfo::TimestampWithOffset
    sig do
      params(
        year: Integer,
        month: Integer,
        day: Integer,
        hour: Integer,
        minute: Integer,
        second: Integer,
        sub_second: Integer,
        dst: T::Array[TZInfo::CountryTimezone]
      ).returns(TZInfo::TimestampWithOffset)
    end
    def local_timestamp(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, dst = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def canonical_identifier; end

    # RDL Type: () -> TZInfo::Timestamp
    sig { returns(TZInfo::Timestamp) }
    def now; end

    # RDL Type: () -> TZInfo::OffsetTimezonePeriod
    sig { returns(TZInfo::OffsetTimezonePeriod) }
    def current_period; end

    # RDL Type: () -> [TZInfo::Timestamp, (XXX or nil)]
    sig { returns(T::Array[T.untyped]) }
    def current_time_and_period; end

    # RDL Type: (Number, ?([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> String
    sig { params(format: Integer, time: T.untyped).returns(String) }
    def strftime(format, time = nil); end

    # RDL Type: (?XXX) -> String
    sig { params(time: T.untyped).returns(String) }
    def abbreviation(time = nil); end

    # RDL Type: (?XXX) -> (false or true)
    sig { params(time: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def dst?(time = nil); end

    # RDL Type: (?XXX) -> String
    sig { params(time: T.untyped).returns(String) }
    def base_utc_offset(time = nil); end

    # RDL Type: (?XXX) -> String
    sig { params(time: T.untyped).returns(String) }
    def observed_utc_offset(time = nil); end

    # RDL Type: (([ identifier: () -> XXX ] and [ is_a?: (Class) -> XXX ])) -> Number
    sig { params(tz: T.untyped).returns(Integer) }
    def <=>(tz); end

    # RDL Type: (XXX) -> (false or true)
    sig { params(tz: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def eql?(tz); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: ([ =~: (XXX) -> XXX ]) -> XXX
    sig { params(regexp: T.untyped).returns(T.untyped) }
    def =~(regexp); end

    # RDL Type: (TZInfo::TimezoneOffset) -> String
    sig { params(limit: TZInfo::TimezoneOffset).returns(String) }
    def _dump(limit); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def raise_unknown_timezone; end
  end

  class TimezoneProxy
    # RDL Type: (TZInfo::TimezoneOffset) -> self
    sig { params(identifier: TZInfo::TimezoneOffset).returns(T.self_type) }
    def initialize(identifier); end

    # RDL Type: () -> TZInfo::TimezoneOffset
    sig { returns(TZInfo::TimezoneOffset) }
    def identifier; end

    # RDL Type: (Number) -> TZInfo::TransitionsTimezonePeriod
    sig { params(time: Integer).returns(TZInfo::TransitionsTimezonePeriod) }
    def period_for(time); end

    # RDL Type: (Number) -> Array<XXX>
    sig { params(local_time: Integer).returns(T::Array[T.untyped]) }
    def periods_for_local(local_time); end

    # RDL Type: (TZInfo::TimezoneOffset, ?TZInfo::TimezoneOffset) -> Array<XXX>
    sig { params(to: TZInfo::TimezoneOffset, from: TZInfo::TimezoneOffset).returns(T::Array[T.untyped]) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def canonical_zone; end

    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::TimezoneOffset
    sig { params(limit: TZInfo::TimezoneOffset).returns(TZInfo::TimezoneOffset) }
    def _dump(limit); end

    # RDL Type: () -> nil
    sig { void }
    def real_timezone; end
  end

  class Timestamp
    # RDL Type: () -> (false or nil or true)
    sig { returns(T.any(FalseClass, NilClass, TrueClass)) }
    def utc?; end

    # RDL Type: (Number, ([ !=: (:utc) -> XXX ] and [ ==: ((:utc or XXX)) -> (false or true) ] and [ kind_of?: (Class) -> XXX ])) -> Object
    sig { params(seconds: Integer, utc_offset: T.untyped).returns(Object) }
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

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def to_i; end

    # RDL Type: (XXX) -> String
    sig { params(format: T.untyped).returns(String) }
    def strftime(format); end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end

    # RDL Type: (([ kind_of?: (Class) -> XXX ] and [ sub_second: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> Number
    sig { params(t: T.untyped).returns(Integer) }
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

    # RDL Type: (?Number) -> String
    sig { params(offset: Integer).returns(String) }
    def value_and_sub_second_to_s(offset = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def sub_second_to_s; end

    # RDL Type: ((Number and [ to_r: () -> XXX ]), ?Number, ?Number) -> Number
    sig { params(value: T.untyped, sub_second: Integer, utc_offset: Integer).returns(Integer) }
    def initialize!(value, sub_second = nil, utc_offset = nil); end
  end

  class TimestampWithOffset
    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::TimestampWithOffset
    sig { params(timezone_offset: TZInfo::TimezoneOffset).returns(TZInfo::TimestampWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_time; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_datetime; end
  end

  class OffsetTimezonePeriod
    # RDL Type: (TZInfo::TimezoneOffset) -> self
    sig { params(offset: TZInfo::TimezoneOffset).returns(T.self_type) }
    def initialize(offset); end

    # RDL Type: () -> TZInfo::TransitionsTimezonePeriod
    sig { returns(TZInfo::TransitionsTimezonePeriod) }
    def start_transition; end

    # RDL Type: () -> TZInfo::TransitionsTimezonePeriod
    sig { returns(TZInfo::TransitionsTimezonePeriod) }
    def end_transition; end

    # RDL Type: (([ kind_of?: (Class) -> XXX ] and [ offset: () -> XXX ])) -> (false or true)
    sig { params(p: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def ==(p); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end
  end

  class Country
    # RDL Type: (([ code: () -> XXX ] and [ name: () -> XXX ] and [ zones: () -> XXX ])) -> self
    sig { params(info: T.untyped).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
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

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def zone_identifiers; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def zone_info; end

    # RDL Type: (([ code: () -> XXX ] and [ is_a?: (Class) -> XXX ])) -> Number
    sig { params(c: T.untyped).returns(Integer) }
    def <=>(c); end

    # RDL Type: (XXX) -> (false or true)
    sig { params(c: T.untyped).returns(T.any(FalseClass, TrueClass)) }
    def eql?(c); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def hash; end

    # RDL Type: ([ =~: (XXX) -> XXX ]) -> XXX
    sig { params(regexp: T.untyped).returns(T.untyped) }
    def =~(regexp); end

    # RDL Type: (TZInfo::TimezoneOffset) -> Number
    sig { params(limit: TZInfo::TimezoneOffset).returns(Integer) }
    def _dump(limit); end
  end

  class TimezoneTransition
    # RDL Type: (TZInfo::TimezoneOffset, TZInfo::TimezoneOffset, Number) -> self
    sig { params(offset: TZInfo::TimezoneOffset, previous_offset: TZInfo::TimezoneOffset, timestamp_value: Integer).returns(T.self_type) }
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

  class TimeWithOffset
    # RDL Type: ((Number and [ observed_utc_offset: () -> XXX ])) -> TZInfo::TimeWithOffset
    sig { params(timezone_offset: T.untyped).returns(TZInfo::TimeWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def dst?; end

    # RDL Type: () -> TZInfo::TimeWithOffset
    sig { returns(TZInfo::TimeWithOffset) }
    def gmtime; end

    # RDL Type: (?XXX) -> Array<XXX>
    sig { params(ndigits: T.untyped).returns(T::Array[T.untyped]) }
    def round(ndigits = nil); end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_a; end

    # RDL Type: () -> TZInfo::TimeWithOffset
    sig { returns(TZInfo::TimeWithOffset) }
    def utc; end

    # RDL Type: () -> String
    sig { returns(String) }
    def zone; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_datetime; end
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

  class DateTimeWithOffset
    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::DateTimeWithOffset
    sig { params(timezone_offset: TZInfo::TimezoneOffset).returns(TZInfo::DateTimeWithOffset) }
    def set_timezone_offset(timezone_offset); end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_time; end

    # RDL Type: (TZInfo::TimezoneOffset) {(XXX) -> XXX} -> Number
    sig { params(min: TZInfo::TimezoneOffset).returns(Integer) }
    def downto(min); end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def england; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def gregorian; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def italy; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def julian; end

    # RDL Type: (?XXX) -> Array<XXX>
    sig { params(start: T.untyped).returns(T::Array[T.untyped]) }
    def new_start(start = nil); end

    # RDL Type: (TZInfo::TimezoneOffset, ?XXX) {(XXX) -> XXX} -> Number
    sig { params(limit: TZInfo::TimezoneOffset, step: T.untyped).returns(Integer) }
    def step(limit, step = nil); end

    # RDL Type: (TZInfo::TimezoneOffset) {(XXX) -> XXX} -> Number
    sig { params(max: TZInfo::TimezoneOffset).returns(Integer) }
    def upto(max); end

    # RDL Type: () -> TZInfo::DateTimeWithOffset
    sig { returns(TZInfo::DateTimeWithOffset) }
    def clear_timezone_offset; end
  end

  class DataTimezone
    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::TransitionsTimezonePeriod
    sig { params(time: T.untyped).returns(TZInfo::TransitionsTimezonePeriod) }
    def period_for(time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> TZInfo::TransitionsTimezonePeriod
    sig { params(local_time: T.untyped).returns(TZInfo::TransitionsTimezonePeriod) }
    def periods_for_local(local_time); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ])) -> Array<XXX>
    sig { params(to: T.untyped, from: T.untyped).returns(T::Array[T.untyped]) }
    def transitions_up_to(to, from = nil); end

    # RDL Type: () -> TZInfo::DataTimezone
    sig { returns(TZInfo::DataTimezone) }
    def canonical_zone; end
  end

  class InfoTimezone
    # RDL Type: ((TZInfo::DataSources::DataTimezoneInfo and [ periods_for_local: (XXX) -> XXX ] and [ transitions_up_to: (XXX, (XXX or XXX)) -> XXX ])) -> self
    sig { params(info: T.untyped).returns(T.self_type) }
    def initialize(info); end

    # RDL Type: () -> String
    sig { returns(String) }
    def identifier; end

    # RDL Type: () -> TZInfo::DataSources::DataTimezoneInfo
    sig { returns(TZInfo::DataSources::DataTimezoneInfo) }
    def info; end
  end

  class TimezonePeriod
    # RDL Type: (TZInfo::TimezoneOffset) -> self
    sig { params(offset: TZInfo::TimezoneOffset).returns(T.self_type) }
    def initialize(offset); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def start_transition; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def end_transition; end

    # RDL Type: () -> String
    sig { returns(String) }
    def base_utc_offset; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def std_offset; end

    # RDL Type: () -> String
    sig { returns(String) }
    def abbreviation; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def observed_utc_offset; end

    # RDL Type: () -> (false or true)
    sig { returns(T.any(FalseClass, TrueClass)) }
    def dst?; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
    def starts_at; end

    # RDL Type: () -> TZInfo::TimestampWithOffset
    sig { returns(TZInfo::TimestampWithOffset) }
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

    # RDL Type: (TZInfo::TimezoneOffset) -> XXX
    sig { params(identifier: TZInfo::TimezoneOffset).returns(T.untyped) }
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

    # RDL Type: (TZInfo::TimezoneOffset) -> XXX
    sig { params(code: TZInfo::TimezoneOffset).returns(T.untyped) }
    def get_country_info(code); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def country_codes; end

    # RDL Type: () -> String
    sig { returns(String) }
    def to_s; end

    # RDL Type: () -> String
    sig { returns(String) }
    def inspect; end

    # RDL Type: (TZInfo::TimezoneOffset) -> XXX
    sig { params(identifier: TZInfo::TimezoneOffset).returns(T.untyped) }
    def load_timezone_info(identifier); end

    # RDL Type: (TZInfo::TimezoneOffset) -> XXX
    sig { params(code: TZInfo::TimezoneOffset).returns(T.untyped) }
    def load_country_info(code); end

    # RDL Type: () -> Encoding
    sig { returns(Encoding) }
    def timezone_identifier_encoding; end

    # RDL Type: (String) -> String
    sig { params(identifier: String).returns(String) }
    def validate_timezone_identifier(identifier); end

    # RDL Type: ([ []: (XXX) -> XXX ], ([ encode: (Encoding) -> XXX ] and [ encoding: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ nil?: () -> XXX ]), ?[ ==: (XXX) -> (false or true) ]) -> String
    sig { params(hash: T.untyped, code: T.untyped, encoding: T.untyped).returns(String) }
    def lookup_country_info(hash, code, encoding = nil); end

    # RDL Type: (String) -> XXX
    sig { params(method_name: String).returns(T.untyped) }
    def raise_invalid_data_source(method_name); end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def build_timezone_identifiers; end

    # RDL Type: (([ encode: (XXX) -> XXX ] and [ encoding: () -> XXX ]), [ ==: (XXX) -> (false or true) ]) {(([ encode: (XXX) -> XXX ] and [ encoding: () -> XXX ])) -> XXX} -> nil
    sig { params(string: T.untyped, encoding: T.untyped).void }
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

      # RDL Type: (([ encode: (Encoding) -> XXX ] and [ encoding: () -> XXX ] and [ kind_of?: (Class) -> XXX ] and [ nil?: () -> XXX ])) -> String
      sig { params(code: T.untyped).returns(String) }
      def load_country_info(code); end

      # RDL Type: ((Array<String> or File or Pathname or [ to_str: () -> String ])) -> (false or true)
      sig { params(name: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def require_index(name); end

      # RDL Type: (*XXX) -> (false or true)
      sig { params(file: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def require_data(*file); end
    end

    class ZoneinfoReader
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: ((Pathname or [ to_str: () -> String ])) -> Array<XXX>
      sig { params(file_path: T.untyped).returns(T::Array[T.untyped]) }
      def read(file_path); end

      # RDL Type: ((String and [ -: (Number) -> XXX ])) -> String
      sig { params(long: T.untyped).returns(String) }
      def make_signed_int32(long); end

      # RDL Type: (Number, Number) -> Number
      sig { params(high: Integer, low: Integer).returns(Integer) }
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

    class DataTimezoneInfo
      # RDL Type: (XXX) -> TZInfo::TransitionsTimezonePeriod
      sig { params(timestamp: T.untyped).returns(TZInfo::TransitionsTimezonePeriod) }
      def period_for(timestamp); end

      # RDL Type: (XXX) -> TZInfo::TransitionsTimezonePeriod
      sig { params(local_timestamp: T.untyped).returns(TZInfo::TransitionsTimezonePeriod) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (XXX, ?XXX) -> Array<XXX>
      sig { params(to_timestamp: T.untyped, from_timestamp: T.untyped).returns(T::Array[T.untyped]) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: () -> TZInfo::DataTimezone
      sig { returns(TZInfo::DataTimezone) }
      def create_timezone; end

      # RDL Type: (String) -> XXX
      sig { params(method_name: String).returns(T.untyped) }
      def raise_not_implemented(method_name); end
    end

    class ConstantOffsetDataTimezoneInfo
      # RDL Type: (TZInfo::TimezoneOffset, TZInfo::TimezoneOffset) -> self
      sig { params(identifier: TZInfo::TimezoneOffset, constant_offset: TZInfo::TimezoneOffset).returns(T.self_type) }
      def initialize(identifier, constant_offset); end

      # RDL Type: (Number) -> TZInfo::OffsetTimezonePeriod
      sig { params(timestamp: Integer).returns(TZInfo::OffsetTimezonePeriod) }
      def period_for(timestamp); end

      # RDL Type: (Number) -> [TZInfo::OffsetTimezonePeriod]
      sig { params(local_timestamp: Integer).returns(T::Array[TZInfo::OffsetTimezonePeriod]) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (TZInfo::TimezoneOffset, ?TZInfo::TimezoneOffset) -> Array<XXX>
      sig { params(to_timestamp: TZInfo::TimezoneOffset, from_timestamp: TZInfo::TimezoneOffset).returns(T::Array[T.untyped]) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: () -> TZInfo::OffsetTimezonePeriod
      sig { returns(TZInfo::OffsetTimezonePeriod) }
      def constant_period; end
    end

    class CountryInfo
      # RDL Type: (Hash<Hash<XXX, TZInfo::DataSources::CountryInfo>, TZInfo::DataSources::CountryInfo>, TZInfo::TimezoneOffset, Array<TZInfo::CountryTimezone>) -> self
      sig { params(code: T::Hash[T::Hash[T.untyped, TZInfo::DataSources::CountryInfo], TZInfo::DataSources::CountryInfo], name: TZInfo::TimezoneOffset, zones: T::Array[TZInfo::CountryTimezone]).returns(T.self_type) }
      def initialize(code, name, zones); end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end
    end

    class TransitionsDataTimezoneInfo
      # RDL Type: (TZInfo::TimezoneOffset, ([ empty?: () -> XXX ] and [ freeze: () -> XXX ])) -> self
      sig { params(identifier: TZInfo::TimezoneOffset, transitions: T.untyped).returns(T.self_type) }
      def initialize(identifier, transitions); end

      # RDL Type: (([ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> TZInfo::TransitionsTimezonePeriod
      sig { params(timestamp: T.untyped).returns(TZInfo::TransitionsTimezonePeriod) }
      def period_for(timestamp); end

      # RDL Type: (([ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> Array<TZInfo::TransitionsTimezonePeriod>
      sig { params(local_timestamp: T.untyped).returns(T::Array[TZInfo::TransitionsTimezonePeriod]) }
      def periods_for_local(local_timestamp); end

      # RDL Type: (([ <=: (XXX) -> XXX ] and [ sub_second: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ]), ?([ sub_second: () -> XXX ] and [ utc_offset: () -> XXX ] and [ value: () -> XXX ])) -> Array<TZInfo::TimezoneTransition>
      sig { params(to_timestamp: T.untyped, from_timestamp: T.untyped).returns(T::Array[TZInfo::TimezoneTransition]) }
      def transitions_up_to(to_timestamp, from_timestamp = nil); end

      # RDL Type: ([ timestamp_value: () -> XXX ], ([ sub_second: () -> XXX ] and [ value: () -> XXX ])) -> (false or true)
      sig { params(transition: T.untyped, timestamp: T.untyped).returns(T.any(FalseClass, TrueClass)) }
      def transition_on_or_after_timestamp?(transition, timestamp); end
    end

    class TimezoneInfo
      # RDL Type: (TZInfo::TimezoneOffset) -> self
      sig { params(identifier: TZInfo::TimezoneOffset).returns(T.self_type) }
      def initialize(identifier); end

      # RDL Type: () -> String
      sig { returns(String) }
      def inspect; end

      # RDL Type: () -> TZInfo::TransitionsTimezonePeriod
      sig { returns(TZInfo::TransitionsTimezonePeriod) }
      def create_timezone; end

      # RDL Type: (String) -> TZInfo::TransitionsTimezonePeriod
      sig { params(method_name: String).returns(TZInfo::TransitionsTimezonePeriod) }
      def raise_not_implemented(method_name); end
    end

    class LinkedTimezoneInfo
      # RDL Type: (TZInfo::TimezoneOffset, [ freeze: () -> XXX ]) -> self
      sig { params(identifier: TZInfo::TimezoneOffset, link_to_identifier: T.untyped).returns(T.self_type) }
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
      # RDL Type: (TZInfo::TimezoneOffset, Number, Number, String) -> TZInfo::TimezoneOffset
      sig do
        params(
          id: TZInfo::TimezoneOffset,
          utc_offset: Integer,
          std_offset: Integer,
          abbreviation: String
        ).returns(TZInfo::TimezoneOffset)
      end
      def offset(id, utc_offset, std_offset, abbreviation); end

      # RDL Type: (Number, Number, TZInfo::TimezoneOffset, Number, ?Number, ?Number) -> TZInfo::TimezoneOffset
      sig do
        params(
          year: Integer,
          month: Integer,
          offset_id: TZInfo::TimezoneOffset,
          timestamp_value: Integer,
          datetime_numerator: Integer,
          datetime_denominator: Integer
        ).returns(TZInfo::TimezoneOffset)
      end
      def transition(year, month, offset_id, timestamp_value, datetime_numerator = nil, datetime_denominator = nil); end
    end
  end

  module Format2
    class CountryDefiner
      # RDL Type: (Hash<TZInfo::TimezoneOffset, TZInfo::CountryTimezone>, [ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(shared_timezones: T::Hash[TZInfo::TimezoneOffset, TZInfo::CountryTimezone], identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(shared_timezones, identifier_deduper, description_deduper); end

      # RDL Type: (TZInfo::TimezoneOffset, ?Number, ?Number, ?Number, ?Number, ?TZInfo::TimezoneOffset) -> Array<TZInfo::CountryTimezone>
      sig do
        params(
          identifier_or_reference: TZInfo::TimezoneOffset,
          latitude_numerator: Integer,
          latitude_denominator: Integer,
          longitude_numerator: Integer,
          longitude_denominator: Integer,
          description: TZInfo::TimezoneOffset
        ).returns(T::Array[TZInfo::CountryTimezone])
      end
      def timezone(identifier_or_reference, latitude_numerator = nil, latitude_denominator = nil, longitude_numerator = nil, longitude_denominator = nil, description = nil); end
    end

    class TimezoneDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: () -> (TZInfo::TimezoneOffset or [XXX, XXX])
      sig { returns(T.any(TZInfo::TimezoneOffset, T::Array[T.untyped])) }
      def first_offset; end

      # RDL Type: (TZInfo::TimezoneOffset, Number, Number, String) -> TZInfo::TimezoneOffset
      sig do
        params(
          id: TZInfo::TimezoneOffset,
          base_utc_offset: Integer,
          std_offset: Integer,
          abbreviation: String
        ).returns(TZInfo::TimezoneOffset)
      end
      def offset(id, base_utc_offset, std_offset, abbreviation); end

      # RDL Type: (TZInfo::TimezoneOffset, Number) -> TZInfo::TimezoneOffset
      sig { params(offset_id: TZInfo::TimezoneOffset, timestamp_value: Integer).returns(TZInfo::TimezoneOffset) }
      def transition(offset_id, timestamp_value); end

      # RDL Type: (*XXX) -> Array<XXX>
      sig { params(args: T.untyped).returns(T::Array[T.untyped]) }
      def subsequent_rules(*args); end
    end

    class CountryIndexDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ], [ dedupe: (XXX) -> XXX ]) -> self
      sig { params(identifier_deduper: T.untyped, description_deduper: T.untyped).returns(T.self_type) }
      def initialize(identifier_deduper, description_deduper); end

      # RDL Type: (TZInfo::TimezoneOffset, TZInfo::TimezoneOffset, Number, Number, Number, Number, ?TZInfo::TimezoneOffset) -> TZInfo::CountryTimezone
      sig do
        params(
          reference: TZInfo::TimezoneOffset,
          identifier: TZInfo::TimezoneOffset,
          latitude_numerator: Integer,
          latitude_denominator: Integer,
          longitude_numerator: Integer,
          longitude_denominator: Integer,
          description: TZInfo::TimezoneOffset
        ).returns(TZInfo::CountryTimezone)
      end
      def timezone(reference, identifier, latitude_numerator, latitude_denominator, longitude_numerator, longitude_denominator, description = nil); end

      # RDL Type: (Hash<Hash<XXX, TZInfo::DataSources::CountryInfo>, TZInfo::DataSources::CountryInfo>, TZInfo::TimezoneOffset) {(TZInfo::Format2::CountryDefiner) -> XXX} -> TZInfo::DataSources::CountryInfo
      sig { params(code: T::Hash[T::Hash[T.untyped, TZInfo::DataSources::CountryInfo], TZInfo::DataSources::CountryInfo], name: TZInfo::TimezoneOffset).returns(TZInfo::DataSources::CountryInfo) }
      def country(code, name); end
    end

    class TimezoneIndexDefiner
      # RDL Type: ([ dedupe: (XXX) -> XXX ]) -> self
      sig { params(string_deduper: T.untyped).returns(T.self_type) }
      def initialize(string_deduper); end

      # RDL Type: (TZInfo::TimezoneOffset) -> Array<XXX>
      sig { params(identifier: TZInfo::TimezoneOffset).returns(T::Array[T.untyped]) }
      def data_timezone(identifier); end

      # RDL Type: (TZInfo::TimezoneOffset) -> Array<XXX>
      sig { params(identifier: TZInfo::TimezoneOffset).returns(T::Array[T.untyped]) }
      def linked_timezone(identifier); end
    end
  end
end

class [s]TZInfo
  class Timezone
    # RDL Type: (([ !: () -> XXX ] and [ nil?: () -> XXX ])) -> String
    sig { params(value: T.untyped).returns(String) }
    def default_dst=(value); end

    # RDL Type: () -> Array<TZInfo::CountryTimezone>
    sig { returns(T::Array[TZInfo::CountryTimezone]) }
    def default_dst; end

    # RDL Type: (TZInfo::TimezoneOffset) -> XXX
    sig { params(identifier: TZInfo::TimezoneOffset).returns(T.untyped) }
    def get(identifier); end

    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::TimezoneProxy
    sig { params(identifier: TZInfo::TimezoneOffset).returns(TZInfo::TimezoneProxy) }
    def get_proxy(identifier); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def all; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_identifiers; end

    # RDL Type: () -> Array<XXX>
    sig { returns(T::Array[T.untyped]) }
    def all_data_zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_data_zone_identifiers; end

    # RDL Type: () -> Array<XXX>
    sig { returns(T::Array[T.untyped]) }
    def all_linked_zones; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all_linked_zone_identifiers; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def all_country_zones; end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def all_country_zone_identifiers; end

    # RDL Type: ([ collect: () {(XXX) -> XXX} -> XXX ]) -> XXX
    sig { params(identifiers: T.untyped).returns(T.untyped) }
    def get_proxies(identifiers); end

    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def data_source; end

    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::Country
    sig { params(data: TZInfo::TimezoneOffset).returns(TZInfo::Country) }
    def _load(data); end
  end

  class TimezoneProxy
    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::TimezoneProxy
    sig { params(data: TZInfo::TimezoneOffset).returns(TZInfo::TimezoneProxy) }
    def _load(data); end
  end

  class Timestamp
    # RDL Type: (Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Number, ?Number) -> TZInfo::Timestamp
    sig do
      params(
        year: Integer,
        month: Integer,
        day: Integer,
        hour: Integer,
        minute: Integer,
        second: Integer,
        sub_second: Integer,
        utc_offset: Integer
      ).returns(TZInfo::Timestamp)
    end
    def create(year, month = nil, day = nil, hour = nil, minute = nil, second = nil, sub_second = nil, utc_offset = nil); end

    # RDL Type: (([ respond_to?: (:subsec) -> XXX ] and [ respond_to?: (:to_i) -> XXX ] and [ respond_to?: (:utc_offset) -> XXX ] and [ to_i: () -> Number ] and [ utc_offset: () -> XXX ]), ?XXX) {((XXX or XXX or XXX or XXX)) -> Object} -> TZInfo::Timestamp
    sig { params(value: T.untyped, offset: T.untyped).returns(TZInfo::Timestamp) }
    def for(value, offset = nil); end

    # RDL Type: (XXX, ?Number) -> TZInfo::Timestamp
    sig { params(value: T.untyped, sub_second: Integer).returns(TZInfo::Timestamp) }
    def utc(value, sub_second = nil); end

    # RDL Type: (XXX, ?Number, ?XXX) -> TZInfo::Timestamp
    sig { params(value: T.untyped, sub_second: Integer, utc_offset: T.untyped).returns(TZInfo::Timestamp) }
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

  class TimestampWithOffset
    # RDL Type: (([ sub_second: () -> XXX ] and [ value: () -> XXX ]), TZInfo::TimezoneOffset) -> TZInfo::TimestampWithOffset
    sig { params(timestamp: T.untyped, timezone_offset: TZInfo::TimezoneOffset).returns(TZInfo::TimestampWithOffset) }
    def set_timezone_offset(timestamp, timezone_offset); end
  end

  class Country
    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::Country
    sig { params(code: TZInfo::TimezoneOffset).returns(TZInfo::Country) }
    def get(code); end

    # RDL Type: () -> Number
    sig { returns(Integer) }
    def all_codes; end

    # RDL Type: () -> XXX
    sig { returns(T.untyped) }
    def all; end

    # RDL Type: () -> (TZInfo::DataSources::RubyDataSource or TZInfo::DataSources::ZoneinfoDataSource)
    sig { returns(T.any(TZInfo::DataSources::RubyDataSource, TZInfo::DataSources::ZoneinfoDataSource)) }
    def data_source; end

    # RDL Type: (TZInfo::TimezoneOffset) -> TZInfo::Country
    sig { params(data: TZInfo::TimezoneOffset).returns(TZInfo::Country) }
    def _load(data); end
  end

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
end
