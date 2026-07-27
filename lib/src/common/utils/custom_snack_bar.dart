import 'package:qr_code_generator_app/src/common/constant/app_colors.dart';
import 'package:qr_code_generator_app/src/common/constant/global_variable.dart';
import 'package:qr_code_generator_app/src/common/utils/text_widget.dart';
import 'package:flutter/material.dart';

void showSnackbar({
  VoidCallback? onPressed,
  required String message,
  IconData? icon,
  Color? backgroundColor,
  String? label,
  bool isError = false,
  bool closeButton = false,
  double overflowThreshold = 1.0,
  bool longActionLabel = false,
  bool floatingType = true,
  bool longLength = false,
}) {
  // final appTheme = AppTheme.instance.lightTheme;
  final SnackBarAction? snackBarAction = label != null
      ? SnackBarAction(
          label: longActionLabel ? "" : label,
          onPressed: onPressed ?? () {},
        )
      : null;

  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isError
              ? icon ?? Icons.warning_amber_rounded
              : Icons.done_all_rounded,
          size: 25,
          color: AppColors.whiteColor,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: TextWidget(
            text: message,
            textAlign: TextAlign.start,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    ),
    showCloseIcon: closeButton,
    closeIconColor: AppColors.buttonColor,
    behavior: floatingType ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
    action: snackBarAction,
    duration: Duration(milliseconds: !longLength ? 800 : 2000),
    backgroundColor: isError
        ? AppColors.redColor
        : backgroundColor ?? AppColors.greenColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    actionOverflowThreshold: overflowThreshold,
  );

  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}
