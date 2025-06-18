import 'package:intl/intl.dart';

class CustomDateUtils {
  // create method to get date between 2 dates in string format difference in nights
  //  "dates": {
  //         "start": "16-01-2024",
  //         "end": "20-01-2024"
  //       },

  static int getNightsBetweenDates(String start, String end) {
    // Define the expected date format
    final dateFormat = DateFormat('dd-MM-yyyy');

    // Parse the strings into DateTime objects
    final startDate = dateFormat.parse(start);
    final endDate = dateFormat.parse(end);

    // Calculate the difference in days (nights = days between)
    final difference = endDate.difference(startDate).inDays + 1;

    return difference;
  }

  static String formatDateRange(String start, String end) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    final startDate = dateFormat.parse(start);
    final endDate = dateFormat.parse(end);

    final monthDayFormat = DateFormat('MMM d');
    final yearFormat = DateFormat('yyyy');

    // Format parts
    final startFormatted = monthDayFormat.format(startDate);
    final endFormatted = monthDayFormat.format(endDate);
    final year = yearFormat.format(endDate);
    // (Jan 16 - Jan 20, 2024)
    return '($startFormatted - $endFormatted, $year)';
  }
}
