import 'package:flutter/material.dart';

import 'light_color.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
 
    backgroundColor: LightColor.background,
    primaryColor: LightColor.primarycolor,
    cardTheme: const CardTheme(color: LightColor.background),
    textTheme: const TextTheme(bodyText1: TextStyle(color: LightColor.black)),
    iconTheme: const IconThemeData(color: LightColor.iconColor),
    bottomAppBarColor: LightColor.background,
    dividerColor: LightColor.lightGrey,
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme(),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: LightColor.titleTextColor),
    ),
  );

  static InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      gapPadding: 10,
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    );
    return InputDecorationTheme(
        fillColor: LightColor.background,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: LightColor.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: LightColor.red)));
  }

  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      color: LightColor.primarycolor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static TextStyle h6Style = const TextStyle(fontSize: 16);

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: LightColor.primarycolor,
    );
  }

  static elevatedcancelButtonStyle() {
    return ElevatedButton.styleFrom(
        primary: LightColor.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)));
  }
}
