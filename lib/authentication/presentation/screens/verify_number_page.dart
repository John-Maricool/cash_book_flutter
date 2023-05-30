import 'package:cash_book/utils/global_widgets/global_widgets.dart';
import 'package:cash_book/utils/resuable_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/constants/constants.dart';

class VerifyNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    'assets/svg/back_botton.svg',
                    width: 30.w,
                    height: 30.h,
                  ))),
          SizedBox(
            height: 70.h,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Enter 4 digit verification code sent to 09027901278",
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 18.sp),
              )),
          SizedBox(
            height: 20.h,
          ),
          showPinCode(context),
          SizedBox(
            height: 15.h,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Resend code in 00:24",
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 18.sp),
              )),
          SizedBox(
            height: 60.h,
          ),
          defaultButtons(
              pressed: () {
                Get.dialog(CustomDialog(
                    callback: () {
                      Get.back();
                    },
                    buttonText: "Start Transacting",
                    textDetail:
                        "You have successfully completed registration"));
              },
              text: "Confirm")
        ],
      ),
    )));
  }

  Widget showPinCode(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 60,
        errorBorderColor: Colors.red,
        fieldWidth: 50,
        disabledColor: primaryColor,
        selectedColor: primaryColor,
        inactiveColor: primaryColor,
        activeFillColor: primaryColor,
      ),
      cursorColor: Colors.black,
      length: 4,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (value) {
        //controller.addCode(value);
      },
    );
  }
}
