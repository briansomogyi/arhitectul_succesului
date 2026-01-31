import 'package:flutter/material.dart';
import '../models/day_session.dart';
import '../models/program_data.dart';

// PILONUL 1: Implementation
// Changed to StatefulWidget so checkboxes work
class PracticeLabScreen extends StatefulWidget {
  final List<ProgramData> program;

  const PracticeLabScreen({super.key, required this.program});

  @override
  State<PracticeLabScreen> createState() => _PracticeLabScreenState();
}

class _PracticeLabScreenState extends State<PracticeLabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laboratorul de Practică")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.program.length,
        itemBuilder: (context, index) {
          final week = widget.program[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ExpansionTile(
              initiallyExpanded: index == 0,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  "${week.weekNumber}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                week.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: week.description.isNotEmpty
                  ? Text(week.description, style: const TextStyle(fontSize: 12))
                  : null,
              childrenPadding: const EdgeInsets.only(bottom: 16),
              children: week.days.map((day) => _buildDaySection(day)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDaySection(DaySession day) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Day Name + Lesson Title)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                    // ignore: deprecated_member_use
                  ).colorScheme.secondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  day.dayName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  day.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 2. Daily Quote (If exists)
          if (day.quote.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade800
                    : Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border(
                  left: BorderSide(color: Colors.orange, width: 4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\"${day.quote}\"",
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  if (day.quoteAuthor.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "- ${day.quoteAuthor}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),

          // 3. Lesson Description (Context)
          if (day.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                day.description,
                style: TextStyle(
                  color: Theme.of(
                    context,
                    // ignore: deprecated_member_use
                  ).textTheme.bodyMedium?.color?.withOpacity(0.8),
                ),
              ),
            ),

          const Divider(),

          // 4. Tasks (Action Steps)
          ...day.tasks.map(
            (task) => CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                  color: task.isCompleted ? Colors.grey : null,
                  fontSize: 14,
                ),
              ),
              value: task.isCompleted,
              activeColor: Colors.teal,
              onChanged: (bool? value) {
                // This updates the screen immediately
                setState(() {
                  task.isCompleted = value ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
