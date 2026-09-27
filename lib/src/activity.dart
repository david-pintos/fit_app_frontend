import 'package:flutter/material.dart';

// class ActivityItem: Represents a single event
//    @name: The name of the event
//    @instructor: The name of the instructor for the event
//    @capacity: The maximum number of participants for the event
//    @startTime: The start time of the event
//    @duration: The duration of the event
//
//    This class will be used to represent individual events in the application,
//    and will be displayed in the UI using the ActivityCard widget.
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

// class ActivityCard: A widget that displays an ActivityItem in a card format
//    @activity: The ActivityItem to be displayed in the card
//
//    This widget will be used to display individual events in the application,
//    and will be used in conjunction with the ActivityItem class to represent
//    events in the UI. The card will display the name of the event, the instructor
//    name, the capacity, the start time, and the duration of the event. It
//    will also include a button to allow users to join the event.
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
                  // TODO: Handle join action
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

class ActivityList extends StatelessWidget {
  final List<ActivityItem> activities;

  const ActivityList({
    super.key,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return ActivityCard(activity: activities[index]);
      },
    );
  }
}