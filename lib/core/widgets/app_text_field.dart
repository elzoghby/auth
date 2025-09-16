import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Theme/Local_colors.dart';
import 'border_styles.dart';

typedef StringCallBack = Function(String);

class AppTextField extends StatefulWidget {
  final bool? readOnly;
  final String hint;
  final TextStyle? hintStyle;
  final Widget? label;
  final StringCallBack? value;
  final StringCallBack? changeValueCallback;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final double? width;
  final BorderRadius? borderRidus;
  final Color? textFieldColor;
  final Color? textFieldBorderColor;
  final Color? textFieldEnableBorderColor;
  final TextInputType? textInputType;
  final bool? secured;
  final int? minLines;
  final int? maxLines;
  final int? maxLen;
  final int? errorMaxLine;
  final bool? disabled;
  final VoidCallback? onClick;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final String? endText;
  final String? Function(String?)? validate;
  final TextInputFormatter? mask;
  final AutovalidateMode? mode;
  final Widget? endWidget;
  final Widget? startWidget;
  void Function(String)? onChanged;
  bool? enabled;
  AppTextField({
    Key? key,
    required this.hint,
    this.borderRidus,
    this.secured = false,
    this.textInputType,
    this.onChanged,
    this.width,
  this.enabled ,
    this.label,
    this.value,
    this.style,
    this.minLines,
    this.maxLines,
    this.maxLen,
    this.changeValueCallback,
    this.mask,
    required this.textEditingController,
    this.textFieldColor,
    this.textInputAction,
    this.textFieldBorderColor,
    this.disabled,
    this.onClick,
    this.endText,
    this.validate,
    this.mode,
    this.readOnly = false,
    this.endWidget,
    this.startWidget,
    this.hintStyle,
    this.textFieldEnableBorderColor,
    this.errorMaxLine,
    this.focusNode,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        width: widget.width,
        child: TextFormField(
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly ?? false,
            autovalidateMode: widget.mode,
            inputFormatters: widget.mask != null ? [widget.mask!] : null,
            onTapOutside: (val) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            controller: widget.textEditingController,
            textAlign:
                widget.maxLen != null ? TextAlign.center : TextAlign.start,
            obscureText: (!_visiblePassword && widget.secured!),
            onChanged: widget.onChanged ??
                (val) {
                  if (widget.changeValueCallback != null) {
                    widget.changeValueCallback!(val);
                  }
                },
            validator: widget.validate,
            minLines: widget.minLines,
            maxLength: widget.maxLen,
            maxLines: widget.maxLines ?? 1,
            // onFieldSubmitted: (val) => widget.value!(val),
            style: widget.style ??
                TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 16),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                errorMaxLines: widget.errorMaxLine,
                label: widget.label,
                suffixText: widget.endText,
                hintText: widget.hint,
                hintStyle: widget.hintStyle,
                prefixIcon: widget.startWidget,
                suffixIcon: widget.secured!
                    ? IconButton(
                        onPressed: () => setState(
                            () => _visiblePassword = !_visiblePassword),
                        icon: Icon(_visiblePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: LocalColors.neutral2,
                      )
                    : widget.endWidget,
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: Theme.of(context).textTheme.bodyMedium!.color),
                focusedBorder: AppBorders.getBorder(
                    borderColor:
                        widget.textFieldBorderColor ??  LocalColors.primary40),
                errorBorder: AppBorders.getErrorBorder(
                    radius: widget.borderRidus ?? BorderRadius.circular(4)),
                focusedErrorBorder: AppBorders.getErrorBorder(
                    radius: widget.borderRidus ?? BorderRadius.circular(4)),
                enabledBorder: AppBorders.getEnableBorder(),
                disabledBorder: AppBorders.getBorder(
                    borderColor:
                        widget.textFieldEnableBorderColor ??  LocalColors.neutral2),
                filled: true,
                counter: SizedBox(),
                enabled: widget.disabled != null ? (!widget.disabled!) : true,
                fillColor: widget.textFieldColor ??
                    themeData.appBarTheme.backgroundColor)),
      ),
    );
  }

}
