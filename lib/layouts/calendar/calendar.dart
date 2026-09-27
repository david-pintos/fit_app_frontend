import 'package:fit_app_frontend/layouts/calendar/calendar_utils.dart';
import 'package:fit_app_frontend/layouts/calendar/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_frontend/src/activity.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // TODO: This variables must be moved to a state management solution
  //      (like Provider, Riverpod, etc.) to manage the state of the calendar
  //      and events across the application.
  //      A new class CalendarState must be created to hold the calendar state
  //      and events.
  DateTime selectedDate = DateTime.now();
  final List<ActivityItem> _events = [
    // TODO: The list of events is currently hardcoded for demonstration purposes.
    //   In a real application, this data would likely come from a backend or database.
    ActivityItem(
      name: 'Yoga Class',
      instructor: 'Alice',
      capacity: 20,
      startTime: DateTime.now().add(const Duration(hours: 1)),
      duration: const Duration(hours: 1),
    ),
    ActivityItem(
      name: 'Spin Class',
      instructor: 'Bob',
      capacity: 15,
      startTime: DateTime.now().add(const Duration(hours: 2)),
      duration: const Duration(hours: 1),
    ),
    ActivityItem(
      name: 'Pilates Class',
      instructor: 'Charlie',
      capacity: 10,
      startTime: DateTime.now().add(const Duration(days: 2,hours: 3)),
      duration: const Duration(hours: 1),
    ),
    ActivityItem(
      name: 'Padel Class',
      instructor: 'Mike',
      capacity: 4,
      startTime: DateTime.now().add(const Duration(days: 2,hours: 4)),
      duration: const Duration(hours: 2),
    ),
    ActivityItem(
      name: 'Crossfit Class',
      instructor: 'David',
      capacity: 12,
      startTime: DateTime.now().add(const Duration(days: 40)),
      duration: const Duration(hours: 1),
    ),
  ];

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.0,
      children: [
        Expanded(
          child: CalendarView(
            selectedDate: selectedDate,
            events: _events,
            onDaySelected: _onDaySelected,
          ),
        ),
        Expanded(
          child: ActivityList(activities: getEventsForDay(selectedDate, _events)),
        ),
      ],
    );
  }
}
