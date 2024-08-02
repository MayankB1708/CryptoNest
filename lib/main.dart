import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cryptonest/home_page.dart';
import 'package:flutter/services.dart';
import 'package:cryptonest/models/app_config.dart';
import 'package:get_it/get_it.dart';
import 'package:cryptonest/services/http_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets\config\main.json");
  Map _configData = jsonDecode(_configContent);
  print(_configData);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '⫷ 𝙲𝚛𝚢𝚙𝚝𝚘𝙽𝚎𝚜𝚝 ⫸',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}
