import 'action_step.dart';

class DaySession {
  final String dayName;
  final String title; // Lesson Title (e.g., "Reacția Personală")
  final String quote;
  final String quoteAuthor;
  final String description; // Lesson Body
  final List<ActionStep> tasks;

  DaySession({
    required this.dayName,
    this.title = '',
    this.quote = '',
    this.quoteAuthor = '',
    this.description = '',
    required this.tasks,
  });

  factory DaySession.fromJson(Map<String, dynamic> json) {
    return DaySession(
      dayName: json['dayName'] ?? '',
      title: json['title'] ?? '',
      quote: json['quote'] ?? '',
      quoteAuthor: json['quoteAuthor'] ?? '',
      description: json['description'] ?? '',
      tasks:
          (json['tasks'] as List?)
              ?.map((i) => ActionStep.fromJson(i))
              .toList() ??
          [],
    );
  }
}
