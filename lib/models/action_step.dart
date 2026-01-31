class ActionStep {
  final String title;
  bool isCompleted;

  ActionStep({required this.title, this.isCompleted = false});

  factory ActionStep.fromJson(Map<String, dynamic> json) {
    return ActionStep(
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
