import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    this.title,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.maxLength,
    this.buildCounter,
    this.controller,
    this.titleStyle,
    this.maxLines,
    this.enabled,
    this.onTap,
    this.autofillHints,
  });
  final String? title;
  final TextStyle? titleStyle;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? enabled;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;
  final Widget? Function(BuildContext,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: titleStyle ??
                getMediumStyle(
                  color: context.defaultHintColor,
                ),
          ),
          10.verticalSpace
        ],
        InkWell(
          onTap: onTap,
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            maxLength: maxLength,
            autofillHints: autofillHints,
            buildCounter: buildCounter,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: keyboardType,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            obscureText: obscureText,
            textInputAction: textInputAction,
            style: getMediumStyle(
              color: context.defaultTextColor,
            ),
            validator: validator,
            maxLines: maxLines ?? 1,
            onTapOutside: (event) {
              // FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              // hintText: '\t$hintText',
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
