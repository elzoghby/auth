import 'package:flutter/material.dart';

import '../Theme/Local_colors.dart';
import '../Theme/text_styles.dart';

class AppSnackBar {
  static showSnackBar(context,{required bool isSuccess,required String message,action}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      elevation: 10,
      showCloseIcon: true,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      behavior: SnackBarBehavior.floating,
      closeIconColor: LocalColors.neutral2,
      padding: const EdgeInsets.all(0),
      backgroundColor: LocalColors.white,
      content: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(end: 8),
              width: 8,

              decoration: BoxDecoration(
                  color: isSuccess == false ? LocalColors.error40 : LocalColors.success50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Icon(
                isSuccess == false ? Icons.cancel :Icons.check_circle,
                color: isSuccess == false ? LocalColors.error40 : LocalColors.success50,
                size: 29,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: TextThemes.titleBlackSimiBold
                ),
              ),
            ),
          ],
        ),
      )));
  }



  static showColoredSnakeBar(context,{Color? color,Widget? widget,required String message}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 10,
        showCloseIcon: true,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        closeIconColor: LocalColors.white,
        backgroundColor: color,
        content: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message,style:  TextStyle(color: LocalColors.white,),),
            ))
          ],
        )));
  }

  static showError({required BuildContext context,required String message,}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
