import 'package:fit_app_frontend/config/app_config_provider.dart';
import 'package:fit_app_frontend/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_frontend/src/activity.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _currentDate = DateTime.now();
  final List<ActivityItem> _events = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.0,
      children: [
        Expanded(
          child: TableCalendar(
            locale: parseLocale(context.appConfig.defaultLocale).toString(),
            focusedDay: DateTime.now(),
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            selectedDayPredicate: (day) {
              return isSameDay(_currentDate, day);
            },
            calendarFormat: CalendarFormat.month,
            onDaySelected:(selectedDay, focusedDay) => setState(() {
              _currentDate = selectedDay;
            }),
            shouldFillViewport: true,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryFixedDim,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              holidayTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              holidayDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryFixed.withValues(
                  alpha: 50,
                ),
                shape: BoxShape.circle,
              ),
            ),
            pageJumpingEnabled: true,
            holidayPredicate: (day) {
              // Example: Mark weekends as holidays
              return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
            },
            eventLoader: (day) {
              // Example: Load events for the selected day
              return _events.where((event) => isSameDay(event.startTime, day)).toList();
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _events.length,
            itemBuilder: (context, index) {
              return ActivityCard(activity: _events[index]);
            },
          ),
        ),
      ],
    );
  }
}
