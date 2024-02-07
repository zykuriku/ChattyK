import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'images/logo.jpg',
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            FloatingActionButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()))
              },
              child: Text('Get started'),
            )
          ],
        ),
      ),
    );
  }
}
