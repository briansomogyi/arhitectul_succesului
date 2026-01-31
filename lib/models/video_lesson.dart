class VideoLesson {
  final String title;
  final String description;
  final String duration;
  final String thumbnailUrl;
  final String videoUrl;

  VideoLesson({
    required this.title,
    required this.description,
    required this.duration,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  factory VideoLesson.fromJson(Map<String, dynamic> json) {
    return VideoLesson(
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
    );
  }
}
