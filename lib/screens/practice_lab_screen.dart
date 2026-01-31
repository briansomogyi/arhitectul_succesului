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
            margin: const EdgeInsets.only(bottom: 20),
            child: ExpansionTile(
              initiallyExpanded: index == 0,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  "${week.weekNumber}",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                week.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              children: week.days.map((day) => _buildDaySection(day)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDaySection(DaySession day) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              day.dayName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          // Here is the map with the spread operator (...)
          ...day.tasks.map(
            (task) => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                  color: task.isCompleted ? Colors.grey : null,
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
