import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blueColor = Color(0xFF5d4cdf);
const cardbgColor = Color(0xFFefebfb);
const iconColor = Color(0xFFb5abea);
const bgColor = Color(0xFFcdcae5);
const lightPurple = Color(0xFFccc6ed);

final theme = ThemeData(
  primarySwatch: Colors.amber,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.raleway(
        textStyle: const TextStyle(
            color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w600)),
  ),
);
