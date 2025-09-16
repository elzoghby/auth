import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/assets.dart';
import 'package:flutter/cupertino.dart';


class AuthHeaderWidget extends StatelessWidget {
  final double? marginTop;
  final double? marginBottom;
  const AuthHeaderWidget(
      {super.key, this.marginTop = 0.0, this.marginBottom = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: marginTop ?? 0,
        ),
      Lottie.asset(Assets.imagesAuth,height: 20.h),
        SizedBox(
          height: marginBottom ?? 0,
        ),
      ],
    );
  }
}
