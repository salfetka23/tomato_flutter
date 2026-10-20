import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'main.dart';

@Preview(name: '1. Registration', size: Size(375, 812))
Widget registrationPreview() => previewPage(const RegistrationPage());

@Preview(name: '2. Login', size: Size(375, 812))
Widget loginPreview() => previewPage(const LoginPage());

@Preview(name: '3. Main', size: Size(375, 812))
Widget mainPreview() => previewPage(const MainPage());

@Preview(name: '4. Settings', size: Size(375, 812))
Widget settingsPreview() => previewPage(const SettingsPage());

@Preview(name: '5. Statistics', size: Size(375, 812))
Widget statisticsPreview() => previewPage(const StatisticsPage());

Widget previewPage(Widget child) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(seedColor: red),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      ),
    ),
    home: child,
  );
}
