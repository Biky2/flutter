import 'package:flutter/material.dart';

//import 'package:otp_text_field/otp_field_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class OtpText extends StatelessWidget {
  final OtpFieldControllerV2 otpcontroller;
  bool visible;
  final Function(String?) onchnage;
  OtpText(
      {super.key,
      required this.otpcontroller,
      required this.visible,
      required this.onchnage});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: OTPTextFieldV2(
        controller: otpcontroller,
        length: 4,
        width: MediaQuery.of(context).size.width,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 15,
        style: TextStyle(fontSize: 17),
        onChanged: (pin) {
          print("Changed: " + pin);
        },
        onCompleted: (pin) {
          onchnage(pin);
        },
      ),
    );
  }
}
