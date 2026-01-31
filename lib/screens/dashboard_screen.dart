import 'package:flutter/material.dart';
import '../models/app_content.dart';
import 'practice_lab_screen.dart';
import 'quotes_screen.dart';
import 'video_library_screen.dart';

class DashboardScreen extends StatelessWidget {
  final AppContent content;

  const DashboardScreen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  // Professional architecture/planning background
                  "https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1920&auto=format&fit=crop",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black54, // Darken image for readability
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // 2. Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  // Title
                  Text(
                    "ARHITECTUL\nPROPRIULUI SUCCES",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const Spacer(),

                  // 3. Navigation Buttons
                  _buildNavCard(
                    context,
                    title: "Laboratorul de Practică",
                    subtitle: "Program de 7 Săptămâni",
                    icon: Icons.edit_note,
                    color: Colors.blueAccent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PracticeLabScreen(program: content.program),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNavCard(
                    context,
                    title: "Axiomele Performanței",
                    subtitle: "Citate Zilnice & Inspirație",
                    icon: Icons.lightbulb_outline,
                    color: Colors.orangeAccent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuotesScreen(quotes: content.quotes),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNavCard(
                    context,
                    title: "Protocolul de Autonomie",
                    subtitle: "Bibliotecă Video",
                    icon: Icons.play_circle_outline,
                    color: Colors.tealAccent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoLibraryScreen(videos: content.videos),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.95),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  // ignore: deprecated_member_use
                  color: color.withOpacity(0.8),
                ), // Darker shade for icon
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
