import 'package:flutter/material.dart';

class ActivityItem {
  final String name;
  final String instructor;
  final int capacity;
  final DateTime startTime;
  final Duration duration;

  const ActivityItem({
    required this.name,
    required this.instructor,
    required this.capacity,
    required this.startTime,
    required this.duration,
  });
}

class ActivityCard extends StatelessWidget {
  final ActivityItem activity;

  const ActivityCard({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text(activity.name),
            subtitle: Text(
              'Instructor: ${activity.instructor}\nCapacity: ${activity.capacity}',
            ),
            trailing: Text(
              '${activity.startTime.hour.toString().padLeft(2, '0')}:${activity.startTime.minute.toString().padLeft(2, '0')}\nDuration: ${activity.duration.inMinutes} minutes',
              textAlign: TextAlign.right,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('JOIN'),
                onPressed: () {
                  // Handle join action
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
