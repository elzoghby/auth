import 'package:auth/core/Theme/Local_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../constants/constants.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? enabled;
  final VoidCallback onPress;
  final String? text;
  final Widget? child;
  final Color? backColor;
  final bool? outlined;
  final double? strokeWidth;
  final BorderRadiusDirectional? radius;
  final bool? isCircle;
  const AppButton(
      {Key? key,
      this.enabled = true,
      required this.onPress,
      this.backColor,
      this.text,
      this.child,
      this.width,
      this.height,
      this.radius,
      this.outlined,
      this.strokeWidth,
      this.isCircle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FadeTransition(
        opacity: AlwaysStoppedAnimation(1.0),
        child: outlined == true
            ? OutlinedButton(
                onPressed: enabled! ? onPress : null,
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: backColor ?? LocalColors.primary40,
                        width: strokeWidth ?? 1),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          radius ?? BorderRadius.circular(10.px),
                    )),
                child: child ??
                    Text(text!,
                        style: TextStyle(
                            color: outlined == true ? backColor : LocalColors.white,
                            fontSize: 14.sp,
                            fontFamily: "cairepro")),
              )
            : ElevatedButton(
                 
                onPressed: enabled! ? onPress : null,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(0.0),
                  shape: isCircle == true
                      ? MaterialStateProperty.all(const CircleBorder())
                      : MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: radius ?? BorderRadius.circular(8))),
                  backgroundColor: MaterialStateProperty.all(enabled == true
                      ? backColor ?? LocalColors.primary40

                      : LocalColors.neutral1),
                ),
                child: child ??
                    Text(text!,
                        style: TextStyle(
                          color: enabled == true ? LocalColors.white : LocalColors.neutral7,
                          fontSize: 14,
                          fontFamily: "cairepro",
                        )),
              ),
      ),
    );
  }
}
