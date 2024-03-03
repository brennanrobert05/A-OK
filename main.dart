import 'package:a/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

//From One Signal documentation to calibriate the app with Onesignal and to ask the user permission for notifications to be sent.
  OneSignal.initialize("45bee526-fe6c-4cee-8bd2-22db4fc81a62");
  OneSignal.Notifications.requestPermission(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
