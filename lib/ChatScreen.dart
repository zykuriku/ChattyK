import 'dart:developer';
import 'proChat.dart';
import 'package:clonegpt/chat.dart';
import 'package:clonegpt/proChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'api.dart';
import 'Chatting.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _istyping = false;
  late TextEditingController textEditingController;
  late ScrollController _scrollController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ProChat>(context);
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.jpg'),
        ),
        title: Text('ChatGPT'),
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
                itemCount: chatProvider.chatList.length,
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return ChatWidget(
                      msg: chatProvider.chatList[index].responseData,
                      chatIndex: chatProvider.chatList[index].chatIndex);
                }),
          ),
          if (_istyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 20,
            ),
          ],
          Material(
            color: bg,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    autocorrect: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMessage(chatProvider: chatProvider);
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: 'Message ChatGPT...',
                        hintStyle: TextStyle(color: hint)),
                  )),
                  IconButton(
                      onPressed: () async {
                        await sendMessage(chatProvider: chatProvider);
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  void scroll() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.bounceIn);
  }

  Future<void> sendMessage({required ProChat chatProvider}) async {
    try {
      String msg = textEditingController.text;
      setState(() {
        _istyping = true;

        chatProvider.addMessage(msg: msg);
        textEditingController.clear();
      });
      await chatProvider.getAns(msg: msg);

      setState(() {});
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        scroll();
        _istyping = false;
      });
    }
  }
}
