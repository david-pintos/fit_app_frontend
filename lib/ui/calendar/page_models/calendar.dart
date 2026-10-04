import 'package:fit_app_frontend/ui/calendar/calendar_controller.dart';
import 'package:fit_app_frontend/ui/calendar/calendar_utils.dart';
import 'package:fit_app_frontend/ui/calendar/widgets/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:fit_app_frontend/ui/activities/activity.dart';

// class CalendarPage: A widget that displays a calendar view and a list of events for the selected day
//    This widget will be used to display the calendar and events in the application.
class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

// class _CalendarPageState: The state for the CalendarPage widget
class _CalendarPageState extends State<CalendarPage> {
  final CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context,constraints) {
            final isWide = constraints.maxWidth > 600;

            if (isWide) {
              return Row(
                children: [
                  Expanded(
                    child: CalendarView(
                      selectedDate: _controller.state.selectedDate,
                      focusedDate: _controller.state.focusedDate,
                      events: _controller.state.activities,
                      onDaySelected: _controller.selectDate,
                      onPageChanged: _controller.changeMonth,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ActivityList(activities: getEventsForDay(_controller.state.selectedDate, _controller.state.activities)),
                  ),
                ],
              );
            }

            return Column(
              spacing: 2.0,
              children: [
                CalendarView(
                  selectedDate: _controller.state.selectedDate,
                  focusedDate: _controller.state.focusedDate,
                  events: _controller.state.activities,
                  onDaySelected: _controller.selectDate,
                  onPageChanged: _controller.changeMonth,
                ),
                Expanded(
                  child: ActivityList(activities: getEventsForDay(_controller.state.selectedDate, _controller.state.activities)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
