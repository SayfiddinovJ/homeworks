import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class StringToXFileConverter {
  static Future<XFile?> convert(String? filePath) async {
    if (filePath == null) return null;
    try {
      return XFile(filePath);
    } catch (e) {
      debugPrint('Error converting string to XFile: $e');
      return null;
    }
  }
}
