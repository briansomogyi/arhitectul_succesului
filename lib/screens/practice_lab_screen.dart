import 'package:flutter/material.dart';
import '../models/day_session.dart';
import '../models/program_data.dart';

// PILONUL 1: Implementation
class PracticeLabScreen extends StatelessWidget {
  final List<ProgramData> program;

  const PracticeLabScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Laboratorul de Practică")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: program.length,
        itemBuilder: (context, index) {
          final week = program[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            child: ExpansionTile(
              initiallyExpanded: index == 0, // Open first week by default
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          ...day.tasks.map(
            (task) => CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(task.title),
              value: task.isCompleted,
              activeColor: Colors.teal,
              onChanged: (bool? value) {
                // In a real app with state management (Provider/Bloc),
                // we would update the state here.
                // For this exam demo using Stateless/Stateful mix,
                // we acknowledge it's read-only from JSON.
              },
            ),
          ),
        ],
      ),
    );
  }
}
