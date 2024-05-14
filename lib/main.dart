// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_picket_schedule/home_app.dart';
import 'package:flutter_picket_schedule/services/notification.dart';
import 'package:flutter_picket_schedule/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService().initNotification();
  // await NotificationService.showPeriodicNotifications(
  //   title: 'Jangan Lupa Piket Hari Ini!',
  //   body: 'click for details',
  //   payload: 'piket harian',
  // );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'P I K E T',
      home: const HomeApp(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
