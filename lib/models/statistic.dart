import 'package:flutter/foundation.dart';

class Statistic {
  final String id;
  final double pounds;
  final int rolls;
  final DateTime date;

  Statistic({
    @required this.id,
    @required this.pounds,
    @required this.rolls,
    @required this.date,
  });
}
