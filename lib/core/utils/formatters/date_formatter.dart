import 'package:intl/intl.dart';

String getDayOfWeek(final DateTime dt) {
  return DateFormat.E().format(dt);
}

String getTimeOfDay(final DateTime dt) {
  return DateFormat.Hm().format(dt);
}
