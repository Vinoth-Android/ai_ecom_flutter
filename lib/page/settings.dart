import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Locale _locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings_title"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("profile_settings"),
            _buildLanguageDropdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButton<Locale>(
      value: _locale,
      items: const [
        DropdownMenuItem(value: Locale('en'), child: Text('English')),
        DropdownMenuItem(value: Locale('ta'), child: Text('Tamil')),
        DropdownMenuItem(value: Locale('ml'), child: Text('Malayalam')),
        DropdownMenuItem(value: Locale('hi'), child: Text('Hindi')),
        DropdownMenuItem(value: Locale('gu'), child: Text('Gujarati')),
        DropdownMenuItem(value: Locale('pa'), child: Text('Punjabi')),
        DropdownMenuItem(value: Locale('mr'), child: Text('Marathi')),
      ],
      onChanged: (Locale? newLocale) {
        setState(() {
          _locale = newLocale!;
          // Update language in LanguageController
        });
      },
    );
  }
}
