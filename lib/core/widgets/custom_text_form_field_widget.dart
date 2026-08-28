import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nour_store/core/utilies/app_text_styles.dart';



class CustomTextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool isFilled;
  final Color fillColor;
  final Color borderColor;
  final TextEditingController controller;
  final TextStyle? buttonTextStyle;
  final bool isEditable;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final IconData? prefix;
  final bool isPass;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final double? height;
  final double? cursorHeight;

  const CustomTextFormFieldWidget({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.isFilled = true,
    this.fillColor = const Color(0xFFF5F6FA),
    this.borderColor = Colors.transparent,
    this.isEditable = true,
    this.onTap,
    this.keyboardType,
    this.onChanged,
    this.suffix,
    this.suffixPressed,
    this.prefix,
    this.isPass = false,
    this.validator,
    this.focusNode,
    this.buttonTextStyle,
    this.minLines,
    this.maxLines,
    this.height,
    this.cursorHeight,
  });

  @override
  Widget build(BuildContext context) {
    // final borderRadius = BorderRadius.circular(SizeHelper.radius(12));

    final inputDecoration = InputDecoration(
      labelText: label,
      hintText: hintText,
      // hintStyle: hintText != null ? AppTextStyles.loginPlaceholder : null,
      labelStyle: AppTextStyles.regular12GreyW500,
      floatingLabelStyle: AppTextStyles.regular16.copyWith(
        // color: ThemeColors.loginButtonBlue,
        fontWeight: FontWeight.w600,
      ),
      alignLabelWithHint: true,
      filled: isFilled,
      fillColor: fillColor,
      // contentPadding: EdgeInsets.symmetric(
      //   horizontal: SizeHelper.width(16),
      //   vertical: height != null
      //       ? SizeHelper.height(height! / 4)
      //       : SizeHelper.height(14),
      // ),
      prefixIcon: prefix != null
          ? Icon(prefix, color: Colors.grey.shade600)
          : null,
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffix, color: Colors.grey.shade600),
            )
          : null,
      enabledBorder: OutlineInputBorder(
        // borderRadius: borderRadius,
        borderSide: BorderSide(
          color: borderColor,
          width: borderColor == Colors.transparent ? 0 : 1,
        ),
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: borderRadius,
      //   borderSide: BorderSide(
      //     color: ThemeColors.loginButtonBlue,
      //     width: SizeHelper.width(2),
      //   ),
      // ),
      // errorBorder: OutlineInputBorder(
      //   borderRadius: borderRadius,
      //   borderSide: BorderSide(color: Colors.red, width: SizeHelper.width(1.5)),
      // ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderRadius: borderRadius,
      //   borderSide: BorderSide(color: Colors.red, width: SizeHelper.width(2)),
      // ),
    );

    final textField = TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: isEditable,
      obscureText: isPass,
      validator: validator,
      cursorHeight: cursorHeight,
      // cursorColor: ThemeColors.loginButtonBlue,
      style:
          buttonTextStyle ??
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      minLines: minLines,
      maxLines: maxLines ?? 1,
      decoration: inputDecoration,
    );

    if (height != null) {
      return SizedBox(height: height!.h, child: textField);
    }

    return textField;
  }
}