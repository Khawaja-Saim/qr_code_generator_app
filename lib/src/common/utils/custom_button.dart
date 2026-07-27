import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_generator_app/src/common/constant/app_colors.dart';
import 'package:qr_code_generator_app/src/common/utils/text_widget.dart';

import 'custom_container.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final Color? borderColor;
  final Widget? centerWidget;
  final bool? paddingWidth;
  final List<BoxShadow>? boxShadow;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    this.centerWidget,
    required this.text,
    required this.ontap,
    this.height,
    this.width,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.paddingWidth,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: width ?? double.infinity,
      height: height ?? 55.h,
      borderRadius: borderRadius ?? 16.r,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: boxShadow),
        child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.buttonColor,
            foregroundColor: textColor ?? AppColors.whiteColor,
            elevation: 0,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
          ),
          child:
              centerWidget ??
              TextWidget(
                text: text,
                color: textColor ?? AppColors.whiteColor,
                fontSize: fontSize ?? 18.sp,
                fontWeight: fontWeight ?? FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
