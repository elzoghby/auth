import 'package:auth/core/Theme/Local_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class AppBorders {
  static InputBorder outlineBorder({Color color = const Color(0xFFB08A4E), BorderRadius? radius}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: radius ?? BorderRadius.circular(12.px),
    );
  }

  static InputBorder underlineBorder({Color color = Colors.transparent, BorderRadius? radius}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: radius ?? BorderRadius.circular(12.px),
    );
  }

  static InputBorder getBorder({Color? borderColor, BorderRadius? radius}) {
    return outlineBorder(color: borderColor ?? LocalColors.neutral2, radius: radius ?? BorderRadius.circular(12.px));
  }

  static InputBorder getEnableBorder({Color enableColor = const Color(0xffeaeaea), BorderRadius? radius}) {
    return outlineBorder(color: enableColor, radius: radius ?? BorderRadius.circular(12.px));
  }

  static InputBorder getErrorBorder({BorderRadius? radius}) {
    return outlineBorder(color: Colors.red, radius: radius??BorderRadius.circular(12.px));
  }
}
