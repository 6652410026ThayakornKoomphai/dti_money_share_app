import 'package:dti_money_share_app/views/money_input_ui.dart';
import 'package:dti_money_share_app/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(DtiMoneyShareApp());
}

class DtiMoneyShareApp extends StatelessWidget {
  const DtiMoneyShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
    );
  }
}
