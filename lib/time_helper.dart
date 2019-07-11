import 'package:intl/intl.dart';

class TimeHelper {
  static String getTimeFromCity(int timezone) {
    return DateFormat.Hm().format(
      DateTime.now().toUtc().add(
            Duration(hours: timezone),
          ),
    );
  }
}
