import 'dart:math';

String generateUID() {
  var r = Random();
  return String.fromCharCodes(
      List.generate(999, (index) => r.nextInt(33) + 89));
}
