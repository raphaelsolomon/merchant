import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/services/request.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:merchant/dialog/subscribe.dart' as popupMessage;

import '../model/person/user.dart';

class AuthChangePass extends StatefulWidget {
  const AuthChangePass({Key? key}) : super(key: key);

  @override
  State<AuthChangePass> createState() => _AuthChangePassState();
}

class _AuthChangePassState extends State<AuthChangePass> {
  bool isloading = false;
  final oldPass = TextEditingController();
  final newPass = TextEditingController();
  final confirmPass = TextEditingController();
  final box = Hive.box<User>(BoxName);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F6F6),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
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
                      onTap: () => context.read<HomeController>().onBackPress(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 18.0,
                      ),
                    ),
                    Text(
                      'Change Password',
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
                Expanded(child: SingleChildScrollView(child: Column(
                  children: [
                    Image.asset('assets/imgs/register.png',
                    repeat: ImageRepeat.noRepeat, fit: BoxFit.contain),
                const SizedBox(
                  height: 20.0,
                ),
                // Text(
                //   'Enter your Registered email address to receive your password reset code',
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.poppins(
                //       fontSize: 14.0,
                //       color: Colors.black,
                //       fontWeight: FontWeight.w400),
                // ),
                // const SizedBox(
                //   height: 50.0,
                // ),
                getRegisterPasswordForm(
                  ctl: oldPass,
                  hint: 'Old Password',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                getRegisterPasswordForm(
                  ctl: newPass,
                  hint: 'New Password',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                getRegisterPasswordForm(
                  ctl: confirmPass,
                  hint: 'Confirm Password',
                ),
                const SizedBox(
                  height: 50.0,
                ),
                isloading
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: CircularProgressIndicator()))
                    : getButton(context, () => onExecute(), text: 'Update Password'),
                const SizedBox(
                  height: 30.0,
                ),

                const SizedBox(
                  height: 50.0,
                ),
                  ],
                ),))
              ],
            ),
          )),
    );
  }

  void onExecute() async  {
    if (oldPass.text.trim().isEmpty) {
      popupMessage.dialogMessage(context,
          popupMessage.serviceMessage(context, 'Old password required'));
      return;
    }

    if (newPass.text.trim().isEmpty) {
      popupMessage.dialogMessage(context,
          popupMessage.serviceMessage(context, 'New password required'));
      return;
    }

    if (confirmPass.text.trim().isEmpty) {
      popupMessage.dialogMessage(context,
          popupMessage.serviceMessage(context, 'Confirm password required'));
      return;
    }

    if (newPass.text.trim() != newPass.text.trim()) {
      popupMessage.dialogMessage(context,
          popupMessage.serviceMessage(context, 'Password does not match'));
      return;
    }

    setState(() {
      isloading = true;
    });

    try{
     var request = http.Request('PATCH', Uri.parse('${ROOTAPI}/api/v1/auth/patient/change-password'));
      request.body = json.encode({
        "old_password": oldPass.text.trim(),
        "new_password": newPass.text.trim()
      });
      request.headers.addAll({'Authorization': '${box.get(USERPATH)!.token}', 'Content-Type': 'application/json'});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
          response.stream.bytesToString().then((value)  {
            final parsed = json.decode(value);
            setState(() {
              isloading = false;
            });
            popupMessage.dialogMessage(context,  popupMessage.serviceMessage(context, parsed['message'], status: true));
          });
      } else {
          setState(() {
            isloading = false;
          });
          popupMessage.dialogMessage(context,  popupMessage.serviceMessage(context, response.reasonPhrase, status: false));
    }
    }on SocketException {
      setState(() {
        isloading = false;
      });
      popupMessage.dialogMessage(context,  popupMessage.serviceMessage(context, 'Check Internet Connection', status: false));
    }finally {
     setState(() {
        oldPass.clear();
        newPass.clear();
        confirmPass.clear();
     });
    }
  }
}
