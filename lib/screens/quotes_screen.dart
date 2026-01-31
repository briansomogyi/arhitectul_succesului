import 'package:flutter/material.dart';
import '../models/quote.dart';

// PILONUL 2: Performance Axioms
class QuotesScreen extends StatefulWidget {
  final List<Quote> quotes;

  const QuotesScreen({super.key, required this.quotes});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Axiomele Performanței")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.orange.shade50,
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.quotes.length,
                itemBuilder: (context, index) {
                  final quote = widget.quotes[index];
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      height: 400,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
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
                          Icon(
                            Icons.format_quote_rounded,
                            size: 60,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            quote.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              height: 1.5,
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
            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton.tonalIcon(
                    onPressed: _previousPage,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Anterior"),
                  ),
                  FilledButton.icon(
                    onPressed: _nextPage,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text("Următor"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
