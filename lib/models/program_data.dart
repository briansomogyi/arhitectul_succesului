import 'day_session.dart';

class ProgramData {
  final int weekNumber;
  final String title;
  final String description; // Added description
  final List<String> homeworks;
  final List<DaySession> days;

  ProgramData({
    required this.weekNumber,
    required this.title,
    this.description = '',
    this.homeworks = const [],
    required this.days,
  });

  factory ProgramData.fromJson(Map<String, dynamic> json) {
    return ProgramData(
      weekNumber: json['weekNumber'] ?? 0,
      title: json['title'] ?? '',
      // FIX: This ?? '' prevents the crash if description is missing/null
      description: json['description'] ?? '',
      homeworks:
          (json['homeworks'] as List?)?.map((e) => e.toString()).toList() ?? [],
      days:
          (json['days'] as List?)
              ?.map((i) => DaySession.fromJson(i))
              .toList() ??
          [],
    );
  }
}
