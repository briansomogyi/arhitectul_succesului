import 'action_step.dart';

class DaySession {
  final String dayName;
  final List<ActionStep> tasks;

  DaySession({required this.dayName, required this.tasks});

  factory DaySession.fromJson(Map<String, dynamic> json) {
    var tasksList = json['tasks'] as List;
    return DaySession(
      dayName: json['dayName'],
      tasks: tasksList.map((i) => ActionStep.fromJson(i)).toList(),
    );
  }
}
