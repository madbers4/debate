import 'dart:math';

String generateUID() {
  var r = Random();
  return String.fromCharCodes(
      List.generate(68, (index) => r.nextInt(33) + 89));
}
