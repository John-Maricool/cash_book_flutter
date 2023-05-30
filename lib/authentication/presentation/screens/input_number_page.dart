import 'package:cash_book/utils/constants/constants.dart';
import 'package:cash_book/utils/constants/routes.dart';
import 'package:cash_book/utils/global_widgets/global_widgets.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputNumberPage extends StatelessWidget {
  CountryCode code = CountryCode(dialCode: "+234");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 45.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Login to auto backup your data security",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    enterPhoneNumber(),
                    SizedBox(
                      height: 20.h,
                    ),
                    defaultButtons(
                        pressed: () {
                          Get.toNamed(VERIFY_NUMBER_PAGE);
                        },
                        text: "VERIFY NUMBER")
                  ],
                ),
              ))),
    );
  }

  Widget enterPhoneNumber() {
    var phoneNumberFormatter = MaskTextInputFormatter(
        mask: '### ### ####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(color: blackColor.withAlpha(100)),
            borderRadius: BorderRadius.circular(5.r),
          ),
          height: 50.h,
          child: CountryCodePicker(
            onChanged: (value) {
              code = value;
            },
            dialogTextStyle:
                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            flagWidth: 28.w,
            padding: EdgeInsets.zero,
            initialSelection: 'NG',
            favorite: const ['+234', 'NG'],
            showCountryOnly: true,
            showFlagDialog: true,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: blackColor.withAlpha(100)),
              borderRadius: BorderRadius.circular(5.r),
            ),
            height: 50.h,
            child: TextField(
              inputFormatters: [phoneNumberFormatter],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Mobile number",
                contentPadding: EdgeInsets.only(left: 9.w, right: 9.w),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0.r),
                    borderSide: BorderSide(color: primaryColor)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
