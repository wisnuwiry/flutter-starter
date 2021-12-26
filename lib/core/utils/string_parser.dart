///
/// Utilities Class for parsing num values
///
class StringParser {
  /// A function to parse dynamic [value] to String.
  /// And for [fallbackValue] is mandatory because when there is an error
  /// in parse it will return the value of [fallbackValue].
  static String parse(dynamic value, {String fallbackValue = ''}) {
    return tryParse(value) ?? fallbackValue;
  }

  /// Parse [value] as a, possibly signed, String literal.
  ///
  /// Like [parse] except that this function returns `null` where a
  /// similar call to [parse] for invalid input [value].
  static String? tryParse(dynamic value) {
    if (value is String) {
      return value;
    } else if (value != null) {
      return value.toString();
    }

    return null;
  }
}
