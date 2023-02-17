import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final kCurrencyFormatterProvider = Provider<NumberFormat>((ref) {
  return NumberFormat.simpleCurrency(locale: "en_US");
});
