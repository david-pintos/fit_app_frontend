import 'package:fit_app_frontend/config/app_config_provider.dart';
import 'package:fit_app_frontend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_frontend/ui/activities/activity.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fit_app_frontend/ui/calendar/calendar_utils.dart';

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
  final DateTime focusedDate;
  final List<ActivityItem> events;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final void Function(DateTime focusedDay) onPageChanged;

  const CalendarView({
    super.key,
    required this.selectedDate,
    required this.focusedDate,
    required this.events,
    required this.onDaySelected,
    required this.onPageChanged,
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

  // function _getRowHeight: Calculates the height of each row in the calendar based on the available height
  double _getRowHeight(double availableHeight) {
    final rowHeight = (availableHeight - 80) / 6; // Subtracting 200 for header and other UI elements

    return rowHeight.clamp(25.0, 60.0); // Ensuring the row height is between 25 and 60
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // If the available height is less than 300, we will use a two-week view instead of a month view
      final rowHeight = _getRowHeight(constraints.maxHeight);
      final calendarFormat = rowHeight < 40 ? CalendarFormat.twoWeeks : CalendarFormat.month;

      return TableCalendar(
        locale: parseLocale(context.appConfig.defaultLocale).toString(),
        focusedDay: focusedDate,
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 365)),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDate, day);
        },
        calendarFormat: calendarFormat,
        onDaySelected: onDaySelected,
        onPageChanged: onPageChanged,
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: _headerStyle(),
        calendarStyle: _calendarStyle(context),
        rowHeight: calendarFormat == CalendarFormat.twoWeeks ? 60 : rowHeight,
        pageJumpingEnabled: true,
        holidayPredicate: isWeekend,
        eventLoader: (day) => getEventsForDay(day, events),
      );
    });
  }
}