import '../../View/Imports/imports.dart';

class SelectedDayAndTimeProvider extends ChangeNotifier {
  int _selectedDay = 1;

  int get selectedDay => _selectedDay;

  void setSelectedDay(int day) {
    _selectedDay = day;
    notifyListeners();
  }

  int _selectedHour = 0;

  int get selectedHour => _selectedHour;

  void setSelectedHour(int hour) {
    _selectedHour = hour;
    notifyListeners();
  }

  int _selectedMinute = 0;

  int get selectedMinute => _selectedMinute;

  void setSelectedMinute(int minute) {
    _selectedMinute = minute;
    notifyListeners();
  }
}
