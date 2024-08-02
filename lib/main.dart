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
  registerHTTPService();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String _configContent =
      await rootBundle.loadString("assets/config/main.json");
  Map _configData = jsonDecode(_configContent);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(
      COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"],
    ),
  );
}

void registerHTTPService() {
  GetIt.instance.registerSingleton<HTTPService>(
    HTTPService(),
  );
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
