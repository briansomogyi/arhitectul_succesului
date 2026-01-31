import 'day_session.dart';

class ProgramData {
  final int weekNumber;
  final String title;
  final List<DaySession> days;

  ProgramData({
    required this.weekNumber,
    required this.title,
    required this.days,
  });

  factory ProgramData.fromJson(Map<String, dynamic> json) {
    var daysList = json['days'] as List;
    return ProgramData(
      weekNumber: json['weekNumber'],
      title: json['title'],
      days: daysList.map((i) => DaySession.fromJson(i)).toList(),
    );
  }
}
