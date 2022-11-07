import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/dialog/subscribe.dart' as popupMessage;
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant/auth/forget_OTP.dart';
import 'package:merchant/auth/login.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/services/request.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class AuthForgotPass extends StatefulWidget {
  const AuthForgotPass({Key? key}) : super(key: key);

  @override
  State<AuthForgotPass> createState() => _AuthForgotPassState();
}

class _AuthForgotPassState extends State<AuthForgotPass> {
  bool isEmail = true;
  late PhoneController phoneController;
  final email = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    phoneController = PhoneController(null);
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 17.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                  Text(
                    '',
                    style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    null,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset('assets/auth/4.jpeg',
                  repeat: ImageRepeat.noRepeat, fit: BoxFit.contain),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                        fontSize: 18.0, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  optionButton(context)
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                isEmail
                    ? 'Enter your Registered email address to receive your password reset instruction'
                    : 'Enter your Registered Mobile Number to receive your password reset instruction',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30.0,
              ),
              isEmail
                  ? getRegisterForm(
                      ctl: email, obscure: false, hint: 'Email Address')
                  : getPhoneNumberForm(ctl: phoneController),
              const SizedBox(
                height: 50.0,
              ),
              isLoading
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator(color: BLUECOLOR),
                      ),
                    )
                  : getButton(context, () => validDate(),
                      text: 'Reset Password'),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () => Get.off(() => AuthLogin()),
                child: Text(
                  'Back to login',
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: BLUECOLOR,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget optionButton(context) => Row(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () => setState(() => isEmail = true),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: isEmail ? BLUECOLOR : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'with Email Address',
                    style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        color: isEmail ? Colors.white : BLUECOLOR),
                  )),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => setState(() => isEmail = false),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: !isEmail ? BLUECOLOR : Colors.transparent,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'with Mobile Number',
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                        fontSize: 12.0,
                        color: !isEmail ? Colors.white : BLUECOLOR),
                  )),
                ),
              ),
            ),
          ),
        ],
      );

  void validDate() async {
    if (isEmail && email.text.trim().isEmpty) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'Input not valid'));
      return;
    }

    if (!isEmail && phoneController.value == null) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'Input not valid'));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final res =
          await http.post(Uri.parse('${ROOTAPI}/api/user/forget/password/init'),
              body: isEmail
                  ? {
                      'email': email.text.trim(),
                    }
                  : {
                      'phone':
                          '+${phoneController.value!.countryCode}${phoneController.value!.nsn}',
                    });
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        popupMessage.dialogMessage(
            context,
            popupMessage.serviceMessage(context, parsed['message'],
                status: true, cB: () {
              Get.to(() => ForgotOtp(
                  isEmail
                      ? email.text.trim()
                      : '+${phoneController.value!.countryCode}${phoneController.value!.nsn}',
                  false));
            }),
            barrierDismiss: false);
      } else {
        final parsed = jsonDecode(res.body);
        popupMessage.dialogMessage(
            context,
            popupMessage.serviceMessage(context, parsed['message'],
                status: false));
      }
    } on SocketException {
      popupMessage.dialogMessage(
          context,
          popupMessage.serviceMessage(
              context, 'Plase check internect connection',
              status: false));
    } finally {
      setState(() {
        isLoading = false;
        email.clear();
        phoneController.reset();
      });
    }
  }
}
