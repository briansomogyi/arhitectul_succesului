import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'models/app_content.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arhitectul Succesului',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2C3E50), // Professional Navy Blue
          secondary: const Color(0xFFE67E22), // Energetic Orange accent
        ),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color(0xFF2C3E50),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.oswald(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const DataLoadingWrapper(),
    );
  }
}

// This widget loads JSON once and passes it down.
// This prevents reloading data every time we switch screens.
class DataLoadingWrapper extends StatefulWidget {
  const DataLoadingWrapper({super.key});

  @override
  State<DataLoadingWrapper> createState() => _DataLoadingWrapperState();
}

class _DataLoadingWrapperState extends State<DataLoadingWrapper> {
  Future<AppContent>? _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = loadJsonData();
  }

  Future<AppContent> loadJsonData() async {
    // Simulating API latency for effect
    await Future.delayed(const Duration(milliseconds: 800));
    final String response = await rootBundle.loadString(
      'assets/data/app_content.json',
    );
    final data = await json.decode(response);
    return AppContent.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppContent>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Eroare la încărcarea datelor: ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
          return DashboardScreen(content: snapshot.data!);
        }
        return const Scaffold(
          body: Center(child: Text("Nicio dată disponibilă.")),
        );
      },
    );
  }
}
