import 'package:flutter/material.dart';
import '../models/quote.dart';

// PILONUL 2: Performance Axioms
class QuotesScreen extends StatelessWidget {
  final List<Quote> quotes;

  const QuotesScreen({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Axiomele Performanței")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange.shade50, Colors.white],
          ),
        ),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.85),
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            final quote = quotes[index];
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                height: 400,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.format_quote_rounded,
                      size: 60,
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      quote.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "— ${quote.author}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
