import 'package:city_weather/feature/login/presentation/login_screen.dart';
import 'package:city_weather/firebase_options.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocationAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        primarySwatch: Colors.blueGrey,
      ),
      home: const LoginScreen(),
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
    );
  }
}
