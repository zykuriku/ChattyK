import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:convert';
import 'Chatting.dart';
import 'k.dart';

class Api {
  static Future<List<Chatting>> getData(String message) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
            'https://api.openai.com/v1/chat/completions',
          ),
          headers: {
            "Authorization": "Bearer ${apikey}",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "user", "content": message}
            ],
            "temperature": 0.7
          }));
      print("data sent");
      String data = response.body;
      var decodedData = jsonDecode(data) as Map<String, dynamic>;
      if (decodedData["error"] != null) {
        throw HttpException(decodedData["error"]["message"]);
      }
      List<Chatting> ChatList = [];
      if (decodedData["choices"].length > 0) {
        ChatList = List.generate(
            decodedData["choices"].length,
            (index) => Chatting(
                  chatIndex: 1,
                  responseData: decodedData['choices'][index]['message']
                      ['content'],
                ));
      }
      return ChatList;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
