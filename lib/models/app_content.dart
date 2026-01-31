import 'program_data.dart';
import 'quote.dart';
import 'video_lesson.dart';

class AppContent {
  final List<ProgramData> program;
  final List<Quote> quotes;
  final List<VideoLesson> videos;

  AppContent({
    required this.program,
    required this.quotes,
    required this.videos,
  });

  factory AppContent.fromJson(Map<String, dynamic> json) {
    return AppContent(
      program: (json['program'] as List)
          .map((i) => ProgramData.fromJson(i))
          .toList(),
      quotes: (json['quotes'] as List).map((i) => Quote.fromJson(i)).toList(),
      videos: (json['videos'] as List)
          .map((i) => VideoLesson.fromJson(i))
          .toList(),
    );
  }
}
