import '../extensions.dart';

class NationalCode {
  static bool isValidNationalCode(String? inputString) {
    if (inputString == null || inputString.isEmpty) {
      return false;
    }
    inputString = inputString.padLeft(10, '0');

    if (inputString.length != 10 && !inputString.isNumeric()) {
      return false;
    }

    var nationalCodeLength = 10;
    var sum = 0;
    for (var i = 0; i < inputString.length - 1; i++) {
      sum += int.parse(inputString[i]) * nationalCodeLength--;
    }

    final remainder = sum % 11;
    final controlNumber = int.parse(inputString[9]);
    return remainder < 2 && controlNumber == remainder ||
        remainder >= 2 && controlNumber == 11 - remainder;
  }

  static bool isValidateNationalCodeLegal(String id) {
    if (id.length != 11) return false;
    if (!RegExp(r'^\d{11}$').hasMatch(id)) return false;

    final List<int> digits = id.split('').map(int.parse).toList();

    final int sum = digits[0] * 2 +
        digits[1] * 3 +
        digits[2] * 4 +
        digits[3] * 5 +
        digits[4] * 6 +
        digits[5] * 7 +
        digits[6] * 8 +
        digits[7] * 9 +
        digits[8] * 10 +
        digits[9] * 2;

    final int remainder = sum % 11;

    final int checkDigit = remainder <= 1 ? remainder : 11 - remainder;

    return checkDigit == digits[10];
  }
}
