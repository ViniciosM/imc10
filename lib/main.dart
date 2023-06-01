import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imc10/models/imc_hive_model.dart';
import 'package:imc10/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ImcHiveModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC APP',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey[400],
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            )),
        colorSchemeSeed: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
