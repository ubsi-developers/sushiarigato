import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/ui/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sushiarigato',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto',
          brightness: Brightness.light,
          primaryColor: ThemeColors.white(),
          scaffoldBackgroundColor: ThemeColors.light()),
      home: const Welcome(),
    );
  }
}
