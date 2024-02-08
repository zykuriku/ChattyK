import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // RemoteConfig remoteConfig = RemoteConfig.instance;
    // await remoteConfig.fetchAndActivate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 40.0, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This is Kavya Pandey\'s ChatGPT clone!',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'images/logo.jpg',
                height: 100.0,
                width: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 80.0),
                child: Material(
                  elevation: 5.0,
                  color: bg,
                  borderRadius: BorderRadius.circular(20.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                    },
                    minWidth: 200.0,
                    elevation: 15.0,
                    highlightElevation: 10.0,
                    highlightColor: hint,
                    height: 42.0,
                    child: Text(
                      'Let\'s get started',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
