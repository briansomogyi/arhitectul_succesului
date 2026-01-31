import 'package:flutter/material.dart';
import '../models/video_lesson.dart';

// PILONUL 3: Autonomy Protocol
class VideoLibraryScreen extends StatelessWidget {
  final List<VideoLesson> videos;

  const VideoLibraryScreen({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bibliotecă Video")),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 20),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Thumbnail Area with Play Button Overlay
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      video.thumbnailUrl,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        color: Colors.grey,
                        child: const Center(child: Icon(Icons.broken_image)),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.3),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.play_circle_fill,
                        size: 64,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Action to play video
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Se deschide: ${video.title}"),
                          ),
                        );
                        // _launchURL(video.videoUrl); // Implementation with url_launcher
                      },
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          video.duration,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // 2. Text Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        video.description,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
