import 'dart:developer';

import 'package:encrypt/encrypt.dart';

Encrypted encrypted;
var decrypted;

String Encrypt(String value, keyCripto) {
  final key = Key.fromUtf8(keyCripto);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  encrypted = encrypter.encrypt(value, iv: iv);
  return encrypted.base64;
}

String Decrypt(value, keyCripto) {
  final key = Key.fromUtf8(keyCripto);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key));
  decrypted = encrypter.decrypt(encrypted, iv: iv);
  return decrypted;
}
