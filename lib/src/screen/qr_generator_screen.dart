import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';

import 'package:qr_code_generator_app/src/common/constant/app_colors.dart';
import 'package:qr_code_generator_app/src/common/utils/custom_button.dart';
import 'package:qr_code_generator_app/src/common/utils/custom_snack_bar.dart';
import 'package:qr_code_generator_app/src/common/utils/custom_text_field.dart';
import 'package:qr_code_generator_app/src/common/utils/text_widget.dart';
import 'package:qr_code_generator_app/src/screen/service/share_service.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({super.key});

  @override
  State<QRGeneratorScreen> createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  final TextEditingController inputController = TextEditingController();

  final ScreenshotController screenshotController = ScreenshotController();

  String qrData = "";

  Future<void> saveQR() async {
    Uint8List? image = await screenshotController.capture();

    if (image == null) return;

    await Gal.putImageBytes(
      image,
      name: "QR_${DateTime.now().millisecondsSinceEpoch}",
    );

    if (mounted) {
      showSnackbar(message: 'Qr Save Successfully');
    }
  }

  Future<void> shareQR() async {
    Uint8List? image = await screenshotController.capture();

    if (image == null) return;

    await ShareService.shareImage(image);
  }

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator"),
        actions: [
          qrData.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: TextWidget(
                    onTap: () {
                      qrData = '';
                      inputController.clear();
                      setState(() {});
                    },
                    text: 'Clear ',
                    color: AppColors.buttonColor,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              CustomTextFormField(
                onChanged: (va) {
                  if (va.isEmpty) {
                    setState(() {
                      qrData = '';
                    });
                    log('----${qrData}');
                  }
                },
                controller: inputController,
                hint: "Enter Text or URL",
                validator: (va) {
                  if (va!.isEmpty) {
                    return 'Input is Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20.h),
              Spacer(),
              if (qrData.isNotEmpty)
                Screenshot(
                  controller: screenshotController,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: QrImageView(
                      data: qrData,
                      version: QrVersions.auto,
                      size: 250.h,
                    ),
                  ),
                ),
              const Spacer(),

              if (qrData.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Save QR',
                        ontap: saveQR,
                        height: 50.h,
                        buttonColor: Color(0xFFF8FAFC),
                        textColor: AppColors.blackColor.withOpacity(.6),
                        borderColor: AppColors.greyColor.withOpacity(.4),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: CustomButton(
                        text: 'Share',
                        ontap: () {},
                        height: 50.h,

                        centerWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.share,
                              color: AppColors.whiteColor,
                              size: 21.h,
                            ),
                            SizedBox(width: 10.w),
                            TextWidget(
                              fontWeight: FontWeight.w500,
                              text: 'Share',
                              fontSize: 18.sp,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20.h),
              CustomButton(
                height: 50.h,
                text: 'Generate QR',
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      qrData = inputController.text.trim();
                    });
                  }
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
