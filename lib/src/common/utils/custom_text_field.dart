import 'package:qr_code_generator_app/src/common/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.labelText,
    this.color,
    this.filledColor,
    this.hint,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.textInputAction,
    this.enable,
    this.maxline,
    this.focusnode,
    this.obsecure,
    this.hintTextColor,
    this.contentpadding,
    this.fontFamily,
    this.borderColor,
    this.fontSize,
    this.hintTextSize,
    this.suffixIcon,
    this.borderRadius,
    this.fontWeight,
    this.hintFontWeight,
    this.onChanged,
    this.focusedBorderColor,
    this.cursorHeight,
    this.textInputColor,
    this.cursorColor,
    this.textAlign,
    this.prefix,
    this.onTap,
    this.maxLength,
    this.readOnly,
    this.autovalidateMode,
  });
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Color? textInputColor;
  final double? cursorHeight;
  final Color? color;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsets? contentpadding;
  final bool? enable;
  final int? maxline;
  final Color? filledColor;
  final String? hint;
  final FocusNode? focusnode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Color? hintTextColor;
  final String? fontFamily;
  final Color? borderColor;
  final double? fontSize;
  final double? hintTextSize;
  final Widget? prefix;
  final double? borderRadius;
  final Widget? suffixIcon;
  final FontWeight? fontWeight;
  final FontWeight? hintFontWeight;
  final bool? obsecure;
  final Color? focusedBorderColor;
  final TextAlign? textAlign;
  final Color? cursorColor;
  final VoidCallback? onTap;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.left,
      controller: controller,
      readOnly: readOnly ?? false,
      validator: validator,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      cursorColor: cursorColor,
      maxLines: maxline ?? 1,
      focusNode: focusnode,
      enabled: enable ?? true,
      cursorHeight: cursorHeight,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      obscureText: obsecure ?? false,
      style: GoogleFonts.poppins(
        color: textInputColor ?? AppColors.blackColor.withOpacity(.8),
        fontSize: fontSize ?? 15.sp,
        decorationColor: AppColors.blackColor.withOpacity(.02),
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefix: prefix,
        errorStyle: GoogleFonts.poppins(color: Colors.red, fontSize: 10.sp),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: filledColor ?? AppColors.blackColor.withOpacity(.02),
        isDense: true,
        contentPadding:
            contentpadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
        hintStyle: GoogleFonts.poppins(
          color: hintTextColor ?? AppColors.blackColor.withOpacity(.5),
          fontSize: hintTextSize ?? 14.sp,
          fontWeight: hintFontWeight ?? FontWeight.w400,
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(
            width: 1.w,
            color: focusedBorderColor ?? AppColors.blackColor.withOpacity(.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.blackColor.withOpacity(.1),
            width: 1.w,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.whiteColor.withOpacity(.1),
            width: 1.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
      ),
      onTap: onTap,
    );
  }
}
