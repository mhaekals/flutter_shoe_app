import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './ui/page/home_screen.dart';
import './ui/page/login_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryTextTheme: TextTheme(
            titleSmall:
                GoogleFonts.roboto(fontSize: 14, color: Colors.black12)),
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
            titleTextStyle:
                GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w700)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    ));
