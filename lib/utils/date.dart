class Date {
  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static const List<String> shortenMonths = [
    "Jan.",
    "Feb.",
    "Mar.",
    "Apr.",
    "May",
    "June",
    "July",
    "Aug.",
    "Sept.",
    "Oct.",
    "Nov.",
    "Dec.",
  ];

  static const List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  static const List<String> shortenDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  static String dateToString(DateTime date) {
    String day = days[date.weekday - 1];
    String calendarDay = date.day.toString();
    String month = months[date.month - 1];
    return "$day $calendarDay $month";
  }

  static String shortenDateToString(DateTime date) {
    String day = shortenDays[date.weekday - 1];
    String calendarDay = date.day.toString();
    String month = shortenMonths[date.month - 1];
    return "$day $calendarDay $month";
  }
}
