import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define your colors
final Color primaryColor = Color.fromARGB(255, 58, 58, 180);
final Color secondaryColor = Color.fromARGB(255, 228, 243, 255);
final Color blueColor = Color.fromARGB(255, 181, 222, 255);
final Color accentColor = Color.fromARGB(255, 255, 157, 148);
final Color mainColorRed = Color.fromARGB(255, 160, 21, 62);
final Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
final Color textColor = Color.fromARGB(255, 80, 73, 73);
final Color textColorBold = Color.fromARGB(255, 18, 18, 18);
final Color backgroundColor2 = Color.fromARGB(255, 250, 250, 250);
final Color iconColor = Color.fromARGB(255, 80, 73, 73);

final Color boldblue = Color.fromARGB(255, 56, 45, 127);

/// Define your light theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  appBarTheme: AppBarTheme(
    color: backgroundColor,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.tenorSans(
            color: const Color.fromARGB(255, 0, 0, 0), fontSize: 48.0)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    displayLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500)
        .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
    bodyLarge: GoogleFonts.inter(color: textColor, fontSize: 18.0)
        .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
    displayMedium: GoogleFonts.sulphurPoint(
            letterSpacing: 1,
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500)
        .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
    displaySmall: GoogleFonts.sulphurPoint(
            letterSpacing: 1, color: iconColor, fontSize: 14)
        .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
    bodySmall: GoogleFonts.sulphurPoint(
            letterSpacing: 1, color: iconColor, fontSize: 12.0)
        .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
    bodyMedium: GoogleFonts.sulphurPoint(color: textColor, fontSize: 14.0)
        .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
    headlineSmall:
        GoogleFonts.inter(color: primaryColor, fontWeight: FontWeight.bold)
            .copyWith(fontFamilyFallback: ['Roboto', 'Arial']),
  ),
);

// Define your dark theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    color: Color.fromARGB(255, 13, 0, 19),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.tenorSans(
            color: const Color.fromARGB(255, 0, 0, 0), fontSize: 48.0)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    bodyLarge: GoogleFonts.roboto(color: Colors.white, fontSize: 18.0)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    displayMedium: GoogleFonts.montserrat(color: Colors.white, fontSize: 15)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    displaySmall: GoogleFonts.montserrat(color: Colors.white, fontSize: 12)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    bodySmall: GoogleFonts.roboto(color: Colors.white, fontSize: 12.0)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    bodyMedium: GoogleFonts.openSans(color: Colors.white, fontSize: 16.0)
        .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
    headlineSmall:
        GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)
            .copyWith(fontFamilyFallback: ['SansSerif', 'Arial']),
  ),
);
