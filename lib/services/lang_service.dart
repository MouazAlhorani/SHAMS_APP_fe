import 'dart:convert';
import 'package:flutter/services.dart';

class LangService {
  static Map<String, dynamic> _data = {};

  static Future<void> load(String langCode) async {
    final jsonString =
        await rootBundle.loadString('assets/langs/$langCode.json');

    _data = json.decode(jsonString);
  }

  static String t(String key) {
    return _data[key] ?? key;
  }

  static void add(String key, String value) {
    _data[key] = value;
  }
}
