import 'package:logger/logger.dart';
import 'package:web3dart/crypto.dart';

String truncateString(String text, int front, int end) {
  int size = front + end;

  if (text.length > size) {
    String finalString =
        "${text.substring(0, front)}...${text.substring(text.length - end)}";
    return finalString;
  }

  return text;
}

String generateSessionMessage(String nonce) {
  int number = 0;
  Logger().d(nonce);
  for (int i = 0; i <= nonce.length - 8; i += 8) {
    final hex = nonce.substring(i, i + 8);
    number = int.parse(hex, radix: 16);
    Logger().d(number);
  }
  return number.toString();
}
