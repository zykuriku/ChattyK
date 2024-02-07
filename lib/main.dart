import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'HomePage.dart';
import 'constants.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(Clonegpt());
}

class Clonegpt extends StatelessWidget {
  const Clonegpt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
