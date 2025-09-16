import 'package:auth/core/Theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Local_colors.dart';

//decoration
final kBorderRadius = BorderRadius.all(Radius.circular(12.px));
const kBorderRadiusSmall = BorderRadius.all(Radius.circular(20));
const kBorderRadiusLarge = BorderRadius.all(Radius.circular(24));
const kBoxShadow = [
  BoxShadow(blurRadius: 2, color: Colors.black12, offset: Offset(1, 1))
];

const elevation1 = [
  BoxShadow(
    color: Color(0x190F0B8A),
// blurRadius: 3,
    offset: Offset(0, 1),
    spreadRadius: 1,
  ),
  BoxShadow(
    color: Color(0x0C0F0B8A),
// blurRadius: 2,
    offset: Offset(0, 1),
    spreadRadius: 0,
  )
];

const elevation2 = [
  BoxShadow(
    color: Color(0x260F0B8A),
    blurRadius: 6,
    offset: Offset(0, 2),
    spreadRadius: 2,
  ),
  BoxShadow(
    color: Color(0x4C0F0B8A),
    blurRadius: 2,
    offset: Offset(0, 1),
    spreadRadius: 0,
  )
];

const elevation3 = [
  BoxShadow(
      blurRadius: 1,
      color: Color.fromRGBO(229, 117, 93, 0.8),
      offset: Offset(0, -5),
      spreadRadius: 0),
];

const elevation4 = [
  BoxShadow(
      blurRadius: 1,
      color: Color.fromRGBO(83, 96, 121, 0.8),
      offset: Offset(0, -5),
      spreadRadius: 0),
];
const elevation5 = [
  BoxShadow(
      blurRadius: 1,
      color: Color.fromRGBO(8, 53, 84, 0.8),
      offset: Offset(0, -5),
      spreadRadius: 0),
];
const kBoxShadowAround = [BoxShadow(blurRadius: 5, color: Colors.black54)];
const kCardHeight = 40.0;
const kContainerDecorationWhiteGradient = BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(0xFF349BD2), Color.fromRGBO(11, 94, 138, 0.00)],
    begin: AlignmentDirectional.topCenter,
    end: AlignmentDirectional.bottomCenter,
  ),
);
// const kContainerDecorationWhiteGradient2 = BoxDecoration(
//   color: LocalColors.Neutral5,
//   // gradient: LinearGradient(
//   //   colors: [
//   //
//   //     Color.fromRGBO(175, 171, 237, 0.40),
//   //     Color.fromRGBO(255, 255, 255, 0.00)
//   //   ],
//   //   begin: AlignmentDirectional.topCenter,
//   //   end: AlignmentDirectional.bottomCenter,
//   // ),
// );

final kContainerDecorationGradient = BoxDecoration(
  // color: LocalColors.Neutral5,
  gradient: LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [Color(0xFFAFAAED), Colors.white.withOpacity(0)],
  ),
);
final kContainerDecorationWhiteGradient3Elv = ShapeDecoration(
  gradient: LinearGradient(
    begin: Alignment(0.00, -1.00),
    end: Alignment(0, 1),
    colors: [Color(0xFF7A76FD), Color(0xFF221AFB)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(22),
  ),
  shadows: elevation1,
);


final elevatedButtonStyle = ButtonStyle(
  visualDensity: VisualDensity.comfortable,
  padding: MaterialStateProperty.all(EdgeInsets.all(14.px)),
  backgroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed)) {
      return LocalColors.primary10;
    } else if (states.contains(MaterialState.hovered)) {
      return LocalColors.primary20;
    } else if (states.contains(MaterialState.disabled)) {
      return LocalColors.neutral8;
    } else {
      return LocalColors.primary40;
    }
  }),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: kBorderRadius,
  )),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.pressed)) {
        return LocalColors.primary10;
      } else if (states.contains(MaterialState.hovered)) {
        return LocalColors.primary20;
      } else if (states.contains(MaterialState.disabled)) {
        return LocalColors.neutral8;
      } else {
        return LocalColors.primary40;
      }
    },
  ),
);
final textButtonStyle = ButtonStyle(
  visualDensity: VisualDensity.comfortable,
  padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(horizontal: 12.px, vertical: 10.px)),
  backgroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed)) {
      return LocalColors.primary10;
    } else if (states.contains(MaterialState.hovered)) {
      return LocalColors.primary20;
    } else if (states.contains(MaterialState.disabled)) {
      return LocalColors.neutral8;
    } else {
      return LocalColors.primary40;
    }
  }),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.px)),
  )),
  iconColor: MaterialStateProperty.all(Colors.white),

  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.pressed)) return LocalColors.primary10;
      if (states.contains(MaterialState.hovered)) {
        return LocalColors.primary20;
      } else {
        return null;
      }
    },
  ),
);

final outlinedButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all(null),
  visualDensity: VisualDensity.comfortable,
  padding: MaterialStateProperty.all(
    EdgeInsets.symmetric(vertical: 8.px, horizontal: 12.px),
  ),
  iconColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed) ||
        states.contains(MaterialState.hovered)) {
      return LocalColors.primary10;
    } else if (states.contains(MaterialState.disabled)) {
      return LocalColors.neutral8;
    } else {
      return LocalColors.primary40;
    }
  }),
  textStyle: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed) ||
        states.contains(MaterialState.hovered)) {
      return TextThemes.subtitleWhiteRegular.copyWith(
          color: null, foreground: Paint()..color = LocalColors.primary10);
    } else if (states.contains(MaterialState.disabled)) {
      return TextThemes.subtitleWhiteRegular.copyWith(
          color: null, foreground: Paint()..color = LocalColors.neutral2);
    } else {
      return TextThemes.subtitleWhiteRegular;
    }
  }),
  side: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.pressed) ||
          states.contains(MaterialState.hovered)) {
        return BorderSide(
          width: 3,
          color: LocalColors.primary10,
        );
      } else if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: LocalColors.neutral2,
        );
      } else {
        return BorderSide(
          color: LocalColors.primary40,
        );
      }
    },
  ),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.px)),
  )),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      return states.contains(MaterialState.pressed) ? Colors.transparent : null;
    },
  ),
);
final outlinedErorrButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.all(null),
  visualDensity: VisualDensity.comfortable,
  padding: MaterialStateProperty.all(
    EdgeInsets.all(14.px),
  ),
  iconColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed) ||
        states.contains(MaterialState.hovered)) {
      return LocalColors.error30;
    } else if (states.contains(MaterialState.disabled)) {
      return LocalColors.neutral1;
    } else {
      return LocalColors.error50;
    }
  }),
  textStyle: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.pressed) ||
        states.contains(MaterialState.hovered)) {
      return TextThemes.titleBlackSimiBold.copyWith(
          color: null, foreground: Paint()..color = LocalColors.error30);
    } else if (states.contains(MaterialState.disabled)) {
      return TextThemes.titleBlackSimiBold.copyWith(
          color: null, foreground: Paint()..color = LocalColors.neutral1);
    } else {
      return TextThemes.titleError30SimiBold;
    }
  }),
  side: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.pressed) ||
          states.contains(MaterialState.hovered)) {
        return BorderSide(
          width: 3,
          color: LocalColors.error30,
        );
      } else if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: LocalColors.neutral1,
        );
      } else {
        return BorderSide(
          color: LocalColors.error50,
        );
      }
    },
  ),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: kBorderRadius,
    ),
  ),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) {
      return states.contains(MaterialState.pressed) ? Colors.transparent : null;
    },
  ),
);
final KFieldInputDecoration = InputDecoration(
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(5.px)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: LocalColors.error50),
    borderRadius: BorderRadius.all(Radius.circular(5.px)),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(5.px)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(5.px)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: LocalColors.primary40),
    borderRadius: BorderRadius.all(Radius.circular(5.px)),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 14.px),
  labelStyle: TextStyle(
    fontSize: 14.px,
    color: LocalColors.neutral2,
  ),
  hintStyle: TextThemes.subtitleNeutralRegular,
);

final InputBorder successBorder = OutlineInputBorder(
  borderSide: BorderSide(color: LocalColors.success50),
  borderRadius: BorderRadius.all(Radius.circular(12.px)),
);
final InputBorder errorBorder = OutlineInputBorder(
  borderSide: BorderSide(color: LocalColors.error50),
  borderRadius: BorderRadius.all(Radius.circular(12.px)),
);
final KFieldInputDecorationborder = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(12.px)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(12.px)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: LocalColors.primary40),
    borderRadius: BorderRadius.all(Radius.circular(12.px)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: LocalColors.error50),
    borderRadius: BorderRadius.all(Radius.circular(12.px)),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 14.px),
  alignLabelWithHint: true,
  // labelStyle: kClickableTextStyle.copyWith(color: kBlack),
  // hintStyle: kClickableTextStyle.copyWith(color: kGrey4)
);
