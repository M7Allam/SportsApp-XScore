class Time{
  final String clientIP;
  final String timezone;
  final String datetime;
  final String utcDatetime;
  final String utcOffset;
  final int dayOfWeek;
  final int dayOfYear;
  final int weekNumber;

  const Time({
    required this.clientIP,
    required this.timezone,
    required this.datetime,
    required this.utcDatetime,
    required this.utcOffset,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.weekNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'client_ip': clientIP,
      'timezone': timezone,
      'datetime': datetime,
      'utc_datetime': utcDatetime,
      'utc_offset': utcOffset,
      'day_of_week': dayOfWeek,
      'day_of_year': dayOfYear,
      'week_number': weekNumber,
    };
  }

  factory Time.fromMap(Map<String, dynamic> map) {
    return Time(
      clientIP: map['client_ip'] as String,
      timezone: map['timezone'] as String,
      datetime: map['datetime'] as String,
      utcDatetime: map['utc_datetime'] as String,
      utcOffset: map['utc_offset'] as String,
      dayOfWeek: map['day_of_week'] as int,
      dayOfYear: map['day_of_year'] as int,
      weekNumber: map['week_number'] as int,
    );
  }
}