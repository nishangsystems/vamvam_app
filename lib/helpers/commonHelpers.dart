import 'dart:math';

String generateRandomString(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final random = Random();
  String result = '';

  for (int i = 0; i < length; i++) {
    final index = random.nextInt(characters.length);
    result += characters[index];
  }

  return result;
}
