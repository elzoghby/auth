import 'package:auth/core/Theme/Local_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/Theme/text_styles.dart';
import '../../../../core/widgets/app_text_field.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int? errorMaxLine;
  final Widget label;
  final bool? isvisible;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  final FocusNode? focusNode;
  final AutovalidateMode? mode;
  final Color? textFieldColor;
  final bool? enabled;
  final TextInputType? textInputType;

  const LabeledTextField({
    super.key,
    required this.controller,
    this.enabled,
    required this.hint,
    required this.label,
    this.onChanged,
    this.isvisible = false,
    this.suffixIcon,
    this.validator,
    this.errorMaxLine,

    this.textInputType,
    this.focusNode,
    this.mode,
    this.textFieldColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label,
        const SizedBox(height: 8),
        AppTextField(
          textInputType: textInputType ,
          enabled: enabled,
          mode: mode,
          hintStyle:
          TextThemes.subtitleNeutralRegular,
          hint: hint,
          focusNode: focusNode,
          borderRidus: BorderRadius.circular(8),
          secured: isvisible,
          textFieldBorderColor: LocalColors.primary40,
          textEditingController: controller,
          onChanged: onChanged,
          validate: validator,
          errorMaxLine: errorMaxLine,
        ),
      ],
    );
  }
}
