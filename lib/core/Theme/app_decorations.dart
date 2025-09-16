import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Local_colors.dart';
import 'light.theme.dart';

class AppDecorations {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Montserrat',
    colorScheme: ThemeData().colorScheme.copyWith(
        secondary: LocalColors.primary40, primary: LocalColors.primary40),
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlinedButtonStyle),

    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 8.px,
      minLeadingWidth: 5.w,
      dense: true,
      visualDensity: VisualDensity.compact,
      minVerticalPadding: 0,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        centerTitle: true,
        backgroundColor: LocalColors.white),
    textSelectionTheme:
    TextSelectionThemeData(cursorColor: LocalColors.primary40),
    // primarySwatch: Colors.red,
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
    buttonTheme:  ButtonThemeData(
      splashColor: LocalColors.neutral2,
      hoverColor: LocalColors.neutral2,
      minWidth: double.infinity,
      // shape: RoundedRectangleBorder(
      //   borderRadius: kBorderRadius,
      // )
    ),
    scaffoldBackgroundColor: LocalColors.white,
  );

}
