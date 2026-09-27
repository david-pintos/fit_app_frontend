import 'package:fit_app_frontend/src/activity.dart';
import 'package:table_calendar/table_calendar.dart';

// function getEventsForDay: Returns a list of events for a given day
//    @day: The day for which to retrieve events
//    @events: The list of all events
//
//    Return: List<ActivityItem>
List<ActivityItem> getEventsForDay(DateTime day, List<ActivityItem> events) {
  return events.where((event) {
    return isSameDay(event.startTime, day);
  }).toList();
}

// function isWeekend: Checks if a given day is a weekend (Saturday or Sunday)
//    @day: The day to check
//
//    Return: bool
bool isWeekend(DateTime day) {
  return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
}