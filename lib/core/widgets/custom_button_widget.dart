import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final TextStyle? buttonTextStyle;
  final bool isLoading;
  final Color? background;


  final bool isOutlined;
  final Color? borderColor;

  const CustomButton({
    required this.onPressed,
    required this.text,
    required this.width,
    this.height = 50,
    this.buttonTextStyle,
    this.isLoading = false,
    this.background,
    this.isOutlined = false, 
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor =
        borderColor ?? background ?? Theme.of(context).primaryColor;

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined
              ? Colors.transparent
              : (background ?? Theme.of(context).primaryColor),

          elevation: isOutlined ? 0 : null,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: isOutlined
                ? BorderSide(color: effectiveBorderColor, width: 1.5)
                : BorderSide.none,
          ),

          minimumSize: Size(width, height.h),
        ),
        child: isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color:
                      buttonTextStyle?.color ??
                      (isOutlined ? effectiveBorderColor : Colors.white),
                ),
              )
            : Text(
                text,
                style:
                    buttonTextStyle ??
                    TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isOutlined ? effectiveBorderColor : Colors.white,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }
}