import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          displaySmall: GoogleFonts.openSans(
              color: Colors.amber[300],
              fontSize: 25,
              fontWeight: FontWeight.bold),
          bodyLarge:
              GoogleFonts.openSans(color: Colors.grey[600], fontSize: 22),
          bodyMedium:
              GoogleFonts.openSans(color: Colors.grey[600], fontSize: 17),
        ),
      ),

    );
  }
}
