import 'package:flutter/cupertino.dart';

import 'Chatting.dart';
import 'api.dart';

class ProChat extends ChangeNotifier {
  List<Chatting> chatList = [];
  List<Chatting> get getList {
    return chatList;
  }

  void addMessage({required String msg}) {
    chatList.add(Chatting(responseData: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> getAns({required String msg}) async {
    chatList.addAll(await Api.getData(msg));
    notifyListeners();
  }
}
