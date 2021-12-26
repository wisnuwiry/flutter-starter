///
/// Utilities Class for parsing num values
///
class NumParser {
  /// Parse [int] from dynamic value, ex: from API.
  ///
  /// Parsing num [int] with safe without error, when parsing values.
  ///
  /// - [intParse] from [int] return [int]
  /// - [intParse] from [double] return [int]
  /// - [intParse] from [String] return [int] when String value is valid, and
  /// return `null` or [fallbackValue] when `invalid`
  ///
  /// Example to use:
  ///
  /// ```dart
  /// NumParser.intParse('12') // return 12 (as int)
  /// NumParser.intParse(12) // return 12 (as int)
  /// NumParser.intParse(12.1223) // return 12 (as int)
  /// NumParser.intParse(null) // return null
  /// NumParser.intParse('sd12', 100) // return 100 (as int)
  /// ```
  static int intParse(dynamic value, {int fallbackValue = 0}) {
    return tryIntParse(value) ?? fallbackValue;
  }

  /// Parse [value] as a, possibly signed, integer literal.
  ///
  /// Like [intParse] except that this function returns `null` where a
  /// similar call to [intParse] for invalid input [value].
  static int? tryIntParse(dynamic value) {
    try {
      if (value is num) {
        return value.toInt();
      } else if (value is String) {
        return int.tryParse(value);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Parse [double] from dynamic value, ex: from API.
  ///
  /// Parsing num [double] with safe without error, when parsing values.
  ///
  /// - [doubleParse] from [double] return [double]
  /// - [doubleParse] from [double] return [double]
  /// - [doubleParse] from [String] return [double] when String value is valid,
  /// and return `null` or [fallbackValue] when `invalid`
  ///
  /// Example to use:
  ///
  /// ```dart
  /// NumParser.doubleParse('12') // return 12 (as double)
  /// NumParser.doubleParse(12) // return 12 (as double)
  /// NumParser.doubleParse(12.1223) // return 12 (as double)
  /// NumParser.doubleParse(null) // return null
  /// NumParser.doubleParse('sd12', 100) // return 100 (as double)
  /// ```
  static double? doubleParse(dynamic value, {double fallbackValue = 0}) {
    return tryDoubleParse(value) ?? fallbackValue;
  }

  /// Parse [value] as a, possibly signed, double literal.
  ///
  /// Like [doubleParse] except that this function returns `null` where a
  /// similar call to [doubleParse] for invalid input [value].
  static double? tryDoubleParse(dynamic value) {
    try {
      if (value is num) {
        return value.toDouble();
      } else if (value is String) {
        return double.tryParse(value);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
