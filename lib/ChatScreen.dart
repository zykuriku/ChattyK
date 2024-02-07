import 'package:clonegpt/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  List<Chatting> chatList = [];
  @override
  Widget build(BuildContext context) {
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
                itemCount: chatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                      msg: chatList[index].responseData,
                      chatIndex: chatList[index].chatIndex);
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
                    // controller: textEditingController,
                    onSubmitted: (value) {},
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
                        setState(() {
                          _istyping = true;
                        });

                        Api api = Api();
                        chatList =
                            await Api.getData(textEditingController.text);
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
}
