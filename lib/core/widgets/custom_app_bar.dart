import 'package:auth/core/Theme/Local_colors.dart';
import 'package:auth/core/Theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String? title;
  final bool navigated;
  final Widget? trailingWidget;
  final BuildContext appContext;
  final bool isCenter;
  final VoidCallback? customCallBack;
  final Color? appBarColor;
  final Widget? leadingWidget;
  final bool isHomeScreen;
  const CustomAppBar(
      {Key? key,
      this.trailingWidget,
      this.title,
      this.navigated = false,
      required this.appContext,
      this.customCallBack,
      this.isCenter = false,
      this.appBarColor,
      this.leadingWidget,
      this.isHomeScreen = false, this.appBarHeight = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return AppBar(

      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: appBarColor ?? LocalColors.neutral2,
      centerTitle: isCenter,
      actions: trailingWidget != null ? [trailingWidget!] : [],
      leadingWidth: 50,
      leading: leadingWidget ??
          (navigated
              ? InkWell(
                  onTap: () {
                    if (customCallBack != null) {
                      customCallBack?.call();
                      return;
                    }

                    try {
                      GoRouter.of(appContext).pop(appContext);
                    } catch (e) {
                      Navigator.pop(context);
                    }
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.px,
                      ),
                      Icon(Icons.arrow_back_ios_rounded,size: 20.px,color: Colors.white,)
                    ],
                  ))
              : const SizedBox()),
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: TextThemes.titleWhiteSimiBold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }



  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
