import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'HomePage.dart';
import 'constants.dart';
// import 'package:firebase_remote_config/firebase_remote_config.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  // RemoteConfig remoteConfig = await RemoteConfig.instance;
  // await remoteConfig.fetch(expiration: Duration(hours: 1));
  // await remoteConfig.activateFetched();

  // remoteConfig.getValue('key').asString();
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
