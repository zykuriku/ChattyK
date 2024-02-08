import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Chatting.dart';

class Api {
  static Future<List<Chatting>> getData(String message) async {
    try {
      var response = await http.post(
          Uri.parse(
            'https://api.openai.com/v1/chat/completions',
          ),
          headers: {
            "Authorization": "Bearer ${dotenv.env['apikey']}",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "system", "content": message}
            ]
          }));
      print("data sent");
      String data = response.body;
      var decodedData = jsonDecode(data) as Map<String, dynamic>;
      if (decodedData["error"] != null) {
        throw HttpException(decodedData["error"]["message"]);
      }
      List<Chatting> ChatList = [];

      ChatList = List.generate(
          decodedData["choices"].length,
          (index) => Chatting(
                chatIndex: 1,
                responseData: decodedData['choices'][0]['message']['content'],
              ));

      print('data received');
      return ChatList;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
