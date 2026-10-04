import 'package:fit_app_frontend/ui/activities/activity.dart';
import 'package:flutter/material.dart';

// class CalendarState: Represents the state of the calendar
//    @selectedDate: The currently selected date in the calendar
//    @focusedDate: The currently focused date in the calendar
//    @activities: The list of activities
//    @isLoading: A boolean indicating whether the calendar is currently loading data
class CalendarState {
  final DateTime selectedDate;
  final DateTime focusedDate;
  final List<ActivityItem> activities;
  final bool isLoading;

  CalendarState({
    required this.selectedDate,
    required this.focusedDate,
    required this.activities,
    this.isLoading = false,
  });

  // function copyWith: Creates a copy of the current state with updated values
  CalendarState copyWith({
      DateTime? focusedDate,
      DateTime? selectedDate,
      List<ActivityItem>? activities,
      bool? isLoading
  }) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDate: focusedDate ?? this.focusedDate,
      activities: activities ?? this.activities,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// class CalendarController: A controller that manages the state of the calendar
//    This class will be used to manage the state of the calendar, including the
//    selected date, focused date, and the list of activities. It will also handle
//    the logic for loading activities and updating the state when a day is selected
//    or when the month is changed.
class CalendarController extends ChangeNotifier {
  CalendarState _state;

  CalendarController() : _state = CalendarState(
    selectedDate: DateTime.now(),
    focusedDate: DateTime.now(),
    activities: [],
    isLoading: false,
  )
  {
    // Load activities for the current month on initialization
    loadActivities();
  }

  CalendarState get state => _state;

  // function selectDate: Updates the selected date when a day is selected in the calendar
  //    @selectedDay: The day that was selected
  //    @focusedDay: The day that is currently focused in the calendar
  void selectDate(DateTime selectedDate, DateTime focusedDate) {
    _state = _state.copyWith(
      selectedDate: selectedDate,
      focusedDate: focusedDate,
    );

    notifyListeners();
  }

  // function changeMonth: Updates the focused date when the month is changed in the calendar
  //    @date: The new focused date
  void changeMonth(DateTime date) {
    _state = _state.copyWith(
      focusedDate: date,
      isLoading: true,
    );

    notifyListeners();

    loadActivities();

    // TODO: Implement logic to fetch activities for the new month
    // Get month range
    // Retrieve activities from backend
    // Update state with new activities
  }

  // function loadActivities: Loads the activities for the currently focused month
  void loadActivities() {
    // TODO: The list of events is currently hardcoded for demonstration purposes.
    //   In a real application, this data would likely come from a backend or database.
    List<ActivityItem> activities = [
      ActivityItem(
        name: 'Yoga Class',
        instructor: 'Alice',
        capacity: 20,
        startTime: _state.focusedDate.add(const Duration(hours: 1)),
        duration: const Duration(hours: 1),
      ),
      ActivityItem(
        name: 'Spin Class',
        instructor: 'Bob',
        capacity: 15,
        startTime: _state.focusedDate.add(const Duration(hours: 2)),
        duration: const Duration(hours: 1),
      ),
      ActivityItem(
        name: 'Pilates Class',
        instructor: 'Charlie',
        capacity: 10,
        startTime: _state.focusedDate.add(const Duration(days: 2,hours: 3)),
        duration: const Duration(hours: 1),
      ),
      ActivityItem(
        name: 'Padel Class',
        instructor: 'Mike',
        capacity: 4,
        startTime: _state.focusedDate.add(const Duration(days: 2,hours: 4)),
        duration: const Duration(hours: 2),
      ),
      ActivityItem(
        name: 'Crossfit Class',
        instructor: 'David',
        capacity: 12,
        startTime: _state.focusedDate.add(const Duration(days: 15)),
        duration: const Duration(hours: 1),
      ),
    ];

    _state = _state.copyWith(
      activities: activities,
      isLoading: false,
    );

    notifyListeners();
  }
}