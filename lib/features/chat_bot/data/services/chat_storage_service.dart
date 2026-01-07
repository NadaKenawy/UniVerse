import 'dart:convert';
import 'dart:developer';

import 'package:universe/core/constants/shared_pref_helper.dart';

class ChatStorageService {
  static const String _chatKey = 'university_chat_messages';
  static const int _maxMessages = 30;

  static Future<void> saveMessages(
      List<Map<String, dynamic>> messages) async {
    try {
      if (messages.length > _maxMessages) {
        messages = messages.sublist(messages.length - _maxMessages);
      }

      await SharedPrefHelper.setData(
        _chatKey,
        jsonEncode(messages),
      );
    } catch (e) {
      log('Error saving messages: $e');
    }
  }

  static Future<List<Map<String, dynamic>>> getMessages() async {
    try {
      final data = await SharedPrefHelper.getString(_chatKey);
      if (data.isEmpty) return [];

      final List decoded = jsonDecode(data);
      return decoded.cast<Map<String, dynamic>>();
    } catch (e) {
      log('Error getting messages: $e');
      return [];
    }
  }

  static Future<void> clearMessages() async {
    await SharedPrefHelper.removeData(_chatKey);
  }
}
