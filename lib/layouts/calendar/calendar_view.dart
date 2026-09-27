import 'package:fit_app_frontend/config/app_config_provider.dart';
import 'package:fit_app_frontend/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_frontend/src/activity.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fit_app_frontend/layouts/calendar/calendar_utils.dart';

// class CalendarView: A widget that displays a calendar view with events
//    @selectedDate: The currently selected date in the calendar
//    @events: The list of events to be displayed in the calendar
//    @onDaySelected: A callback function that is called when a day is selected in the calendar
//
//    This widget will be used to display a calendar view in the application,
//    and will be used in conjunction with the CalendarPage widget to represent
//    the calendar and events in the UI.
class CalendarView extends StatelessWidget {
  final DateTime selectedDate;
  final List<ActivityItem> events;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  const CalendarView({
    super.key,
    required this.selectedDate,
    required this.events,
    required this.onDaySelected,
  });

  CalendarStyle _calendarStyle(BuildContext context) {
    return CalendarStyle(
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
    );
  }

  HeaderStyle _headerStyle() {
    return const HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: parseLocale(context.appConfig.defaultLocale).toString(),
      focusedDay: selectedDate,
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(const Duration(days: 365)),
      selectedDayPredicate: (day) {
        return isSameDay(selectedDate, day);
      },
      calendarFormat: CalendarFormat.month,
      onDaySelected: onDaySelected,
      shouldFillViewport: true,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: _headerStyle(),
      calendarStyle: _calendarStyle(context),
      pageJumpingEnabled: true,
      holidayPredicate: isWeekend,
      eventLoader: (day) => getEventsForDay(day, events),
    );
  }
}