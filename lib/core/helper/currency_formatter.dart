import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static String toIDR(num amount, {String symbol = ''}) {
    final formatCurrency = NumberFormat.currency(
      locale: 'in_ID',
      symbol: symbol,
      decimalDigits: 0,
    );
    return formatCurrency.format(amount);
  }

  static String compat(String? amount) {
    final doubleValue = double.parse(amount ?? "0");
    final formatCurrency = NumberFormat.compactSimpleCurrency(
      locale: 'in_ID',
      decimalDigits: 0,
    );
    return formatCurrency.format(doubleValue);
  }

  static String compatSymbol({
    required String amount,
    String symbol = '',
  }) {
    final doubleValue = double.parse(amount);
    final formatCurrency = NumberFormat.compactCurrency(
      locale: 'in_ID',
      decimalDigits: 0,
      symbol: symbol,
    );
    return formatCurrency.format(doubleValue);
  }
}
