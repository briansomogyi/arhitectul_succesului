class ActionStep {
  final String title;
  bool isCompleted;

  ActionStep({required this.title, this.isCompleted = false});

  factory ActionStep.fromJson(Map<String, dynamic> json) {
    return ActionStep(
      // Maps 'text' (from data.json) or 'title' (standard) to the title field
      title: json['title'] ?? json['text'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
