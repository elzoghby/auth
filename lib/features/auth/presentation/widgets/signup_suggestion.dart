import 'package:auth/core/Theme/Local_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/Theme/text_styles.dart';

class SignUpSuggestion extends StatelessWidget {
  final VoidCallback onTap;

  const SignUpSuggestion({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextThemes.midTitleBlackRegular,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Register',
              style: TextThemes.midTitlePrimaryRegular.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: LocalColors.primary40,
              ),
            ),
          ),
        )
      ],
    );
  }
}
