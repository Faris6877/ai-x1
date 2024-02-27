import 'dart:developer';

import 'package:ai_x1/utils/constents.dart';
import 'package:dio/dio.dart';

final class ApiPost {
  static Future<String> chatTextGenerationContainer(
      List previousMessages) async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey&",
          data: {
            "contents": previousMessages
                .map(
                  (e) => e.toMap(),
                )
                .toList(),
            "generationConfig": generationConfig,
            "safetySettings": safetySettings,
          });
      if (response.statusCode == 200) {
        return response
            .data['candidates'].first['content']['parts'].first['text'];
      }
    } catch (e) {
      log(e.toString());
    }
    return '';
  }
}
