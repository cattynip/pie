class Months {
  static const List<String> months = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String convertFromNumberToString(int month) {
    if (month < 1 || month > 12) return "";

    print(month);

    return months[month - 1];
  }
}
