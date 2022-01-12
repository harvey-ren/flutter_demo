import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class Encrypt {
  ///定义秘钥
  static var _KEY = "0123456789becoin";

  ///定义偏移量
  static var _IV = "0123456789becoin";

  //Base64编码
  static String encodeBase64(String data) {
    return base64Encode(utf8.encode(data));
  }

  //Base64解码
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }

  //AES加密
  static aesEncrypt(plainText) {
    try {
      final key = Key.fromUtf8(_KEY);
      final iv = IV.fromUtf8(_IV);

      /// 这里可以配置类型，
      final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encryptor.encrypt(plainText, iv: iv);
      return encrypted.base16;
    } catch (err) {
      print("aes encode error:$err");
      return plainText;
    }
  }

  //AES解密
  static dynamic aesDecrypt(encrypted) {
    try {
      final key = Key.fromUtf8(_KEY);
      final iv = IV.fromUtf8(_IV);
      final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
      final decrypted = encryptor.decrypt64(encrypted, iv: iv);
      return decrypted;
    } catch (err) {
      print("aes decode error:$err");
      return encrypted;
    }
  }
}
