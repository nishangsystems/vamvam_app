import 'package:intl/intl.dart';

class DateTimeHelper {
  // To Format Date in dd/mm/yyyy
  static String formattedDate(DateTime date) {
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  // To calculate age
  static int calculateAge(DateTime date) {
    final now = DateTime.now();
    final age = now.year - date.year;
    return age;
  }

  // Subtract Years
  DateTime subtractYears(DateTime dateTime, int yearsToSubtract) {
    int yearsInDays = yearsToSubtract * 365 + (yearsToSubtract ~/ 4);
    return dateTime.subtract(Duration(days: yearsInDays));
  }

  // Get Date for users
  static String getUserDate(String dateTime) {
    return DateFormat('dd MMMM yyyy', 'en_US').format(DateTime.parse(dateTime));
  }

  String convertTo24HourFormat(String twelveHourTime) {
    // Parse the 12-hour time string
    final parsedTime = DateFormat('hh:mm a').parse(twelveHourTime);

    // Format it in 24-hour format
    final formattedTime = DateFormat('HH:mm').format(parsedTime);

    return formattedTime;
  }

  String convertTo12HourFormat(String twentyFourHourTime) {
    final parts = twentyFourHourTime.split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    if (hour < 12) {
      return "$hour:${minute.toString().padLeft(2, '0')} AM";
    } else if (hour == 12) {
      return "12:${minute.toString().padLeft(2, '0')} PM";
    } else {
      final twelveHour = hour - 12;
      return "$twelveHour:${minute.toString().padLeft(2, '0')} PM";
    }
  }

  static String timePassed(DateTime datetime, {bool full = true}) {
    try {
      DateTime now = DateTime.now();
      DateTime ago = datetime;
      Duration dur = now.difference(ago);
      int days = dur.inDays;
      int years = days ~/ 365;
      int months = (days - (years * 365)) ~/ 30;
      int weeks = (days - (years * 365 + months * 30)) ~/ 7;
      int rdays = days - (years * 365 + months * 30 + weeks * 7).toInt();
      int hours = (dur.inHours % 24).toInt();
      int minutes = (dur.inMinutes % 60).toInt();
      int seconds = (dur.inSeconds % 60).toInt();
      var diff = {
        "d": rdays,
        "w": weeks,
        "m": months,
        "y": years,
        "s": seconds,
        "i": minutes,
        "h": hours
      };

      Map str = {
        'y': 'year',
        'm': 'month',
        'w': 'week',
        'd': 'day',
        'h': 'hour',
        'i': 'min',
        's': 'sec',
      };

      str.forEach((k, v) {
        if (diff[k]! > 0) {
          str[k] = '${diff[k]} $v${diff[k]! > 1 ? 's' : ''}';
        } else {
          str[k] = "";
        }
      });
      str.removeWhere((index, ele) => ele == "");
      List<String> tlist = [];
      str.forEach((k, v) {
        tlist.add(v);
      });
      if (full) {
        return str.isNotEmpty ? tlist.join(", ") : '0';
      } else {
        return str.isNotEmpty ? tlist[0] : "0";
      }
    } catch (e) {
      rethrow;
    }
  }
}
