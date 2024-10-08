import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLanguage = prefs.getString('selectedLanguage') ?? 'en';

  // Load the localization for the saved language
  runApp(MyApp(savedLanguage: savedLanguage));
}

class MyApp extends StatelessWidget {
  final String savedLanguage;

  MyApp({required this.savedLanguage});

  @override
  Widget build(BuildContext context) {
    // Set the initial locale for the app

    return GetMaterialApp(
      title: 'Language Demo',
      home: const Home(),
      locale: Locale(savedLanguage),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
