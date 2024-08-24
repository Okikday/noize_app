import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noize_app/common/styles/colors.dart';


class NoizeThemes {


  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      primaryColor: NoizeColors.ultraMarine,
      scaffoldBackgroundColor: NoizeColors.antiFlashWhite,
      splashColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: NoizeColors.black,
        onPrimary: NoizeColors.gray,
        secondary: NoizeColors.white,
        onSecondary: NoizeColors.gray,
        
        error: Colors.red,
        onError: Colors.red,
        surface: NoizeColors.lavender.withOpacity(0.75),
        onSurface: Colors.white,
      ));


  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: NoizeColors.ultraMarine,
      scaffoldBackgroundColor: NoizeColors.dark,
      splashColor: Colors.transparent,
      textTheme: GoogleFonts.poppinsTextTheme(),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: NoizeColors.white,
        onPrimary: NoizeColors.gray,
        secondary: NoizeColors.black,
        onSecondary: NoizeColors.dark,
        error: Colors.red,
        onError: Colors.red,
        surface: NoizeColors.dark,
        onSurface: Colors.black,
      ));


}