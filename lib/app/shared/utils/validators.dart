extension StringExtension on String {
  bool get isValidEmail {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }

  bool get isValidPhoneNumber {
    if (length > 16 || length < 9) return false;
    return RegExp(
      r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
    ).hasMatch(this);
  }

  bool get isValidUrl {
    return RegExp(
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
    ).hasMatch(this);
  }

  String get capitalizeFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String get toTitleCase {
    if (isEmpty) return this;
    return split(' ').map((str) => str.capitalizeFirst).join(' ');
  }

  String toK() {
    final value = double.tryParse(this);
    if (value == null) return this;
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(value % 1000000 == 0 ? 0 : 1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k';
    }
    return this;
  }

  int? get toIntOrNull => int.tryParse(this);
  double? get toDoubleOrNull => double.tryParse(this);

  String get hardcoded => this;

  bool get isPhoneNumber => isValidPhoneNumber;
  bool get isURL => isValidUrl;
  bool get isEmail => isValidEmail;

  String get maskEmail {
    if (!isEmail) return this;
    final parts = split('@');
    final name = parts[0];
    final domain = parts[1];
    if (name.length <= 2) return this;
    return '${name.substring(0, 2)}****@$domain';
  }

  String maskCenter([int visibleChars = 4]) {
    if (length <= visibleChars) return this;
    final maskedLength = length - visibleChars;
    final start = (length - maskedLength) ~/ 2;
    return replaceRange(start, start + maskedLength, '*' * maskedLength);
  }

  dynamic toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return int.parse('0x$hexColor');
    }
    return null;
  }
}

extension StringOptionalExtension on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
