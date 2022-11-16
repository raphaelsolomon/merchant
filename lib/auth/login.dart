import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:merchant/auth/forgotpass.dart';
import 'package:merchant/auth/register.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/person/user.dart';
import 'package:merchant/model/referral/referral.dart';
import 'package:merchant/pages/page_selector.dart';
import 'package:merchant/resources/firebase_method.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/services/request.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:merchant/dialog/subscribe.dart' as popupMessage;

class AuthLogin extends StatefulWidget {
  const AuthLogin({Key? key}) : super(key: key);

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  bool isEmail = true;
  bool isLoading = false;
  late final phoneController;
  final email = TextEditingController();
  final password = TextEditingController();
  final box = Hive.box<User>(BoxName);
  final refbox = Hive.box(ReferralBox);

  @override
  void initState() {
    phoneController = PhoneController(null);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      phoneController.addListener(() => setState(() {}));
    });
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/auth/2.jpeg',
                repeat: ImageRepeat.noRepeat,
                fit: BoxFit.cover,
                height: 250,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ))
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in to your account to continue',
                    style: GoogleFonts.poppins(
                        fontSize: 13.0, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  optionButton(context)
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              isEmail
                  ? getRegisterForm(
                      ctl: email, obscure: false, hint: 'Email or username')
                  : getPhoneNumberForm(ctl: phoneController),
              const SizedBox(
                height: 10.0,
              ),
              getRegisterForm(
                  ctl: password,
                  obscure: true,
                  hint: 'Password',
                  icon: Icons.lock),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.to(() => AuthForgotPass()),
                      child: Text(
                        'Forgotten Password?',
                        style: GoogleFonts.poppins(
                            fontSize: 14.5, color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              isLoading
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator(color: BLUECOLOR),
                      ),
                    )
                    :getButton(context, () => Get.to(() => PageSelection())),
                  //: getButton(context, () => validDate()),
              const SizedBox(
                height: 26.0,
              ),
              Row(
                children: [
                  Flexible(
                    child: const Divider(
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Text(
                    'Or Sign in using',
                    style: GoogleFonts.poppins(
                        fontSize: 13.0,
                        color: Color(0xFF838391),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 15.0),
                  Flexible(
                    child: const Divider(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 26.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialAccount(FontAwesome.facebook, Color(0xFF1777F2),
                      callBack: () => FirebaseMethods.facebookLogin()),
                  const SizedBox(
                    width: 20.0,
                  ),
                  socialAccount(FontAwesome.linkedin, Color(0xFF0078B5),
                      callBack: () {
                    Get.to(() => LinkedInUserWidget(
                          redirectUrl: LINKEDIN_REDIRECT,
                          clientId: LINKEDIN_CLIENTID,
                          clientSecret: LINKEDIN_SECRET,
                          projection: const [
                            ProjectionParameters.id,
                            ProjectionParameters.localizedFirstName,
                            ProjectionParameters.localizedLastName,
                            ProjectionParameters.firstName,
                            ProjectionParameters.lastName,
                            ProjectionParameters.profilePicture,
                          ],
                          onGetUserProfile: (user) {
                            // print(
                            //     '${user.user.token.accessToken} - ${user.user.firstName!.localized!.label} - ${user.user.lastName!.localized!.label} - ${user.user.profilePicture!.displayImageContent!.elements!.first.identifiers!.first.identifier} - ${user.user.userId} - ${user.user.email!.elements!.first.handleDeep!.emailAddress}');
                            //Get.offAll(() => DashBoard());
                          },
                          onError: (e) {
                            print('Error: ${e.toString()}');
                            print('Error: ${e.stackTrace.toString()}');
                          },
                        ));
                  }),
                  const SizedBox(
                    width: 20.0,
                  ),
                  socialAccount(FontAwesome.google, Colors.redAccent,
                      callBack: () => FirebaseMethods.googleSignIn()),
                ],
              ),
              const SizedBox(
                height: 26.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.poppins(
                          fontSize: 15.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => AuthRegister()),
                    child: Text('Sign Up',
                        style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: BLUECOLOR,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              const SizedBox(
                height: 46.0,
              ),
            ],
          ),
        ),
      ),
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
    if (password.text.trim().isEmpty) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'password required'));
      return;
    }

    if (isEmail && email.text.trim().isEmpty) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'E-mail is required'));
      return;
    }

    if (isEmail && !email.text.trim().isEmail) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'E-mail is not valid'));
      return;
    }

    if (!isEmail && phoneController.value == null) {
      popupMessage.dialogMessage(context,
          popupMessage.serviceMessage(context, 'Phone Nuber is required'));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final res = await http.post(Uri.parse('${ROOTAPI}/api/user/login'),
          body: isEmail
              ? {
                  'email': email.text.trim(),
                  'password': password.text.trim(),
                }
              : {
                  'phone':
                      '+${phoneController.value!.countryCode}${phoneController.value!.nsn}',
                  'password': password.text.trim(),
                });
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        Map<String, dynamic> result = await ApiServices.getProfile(parsed['data']['access_token']);
        User user = User(
          uid: '${result['data']['user_id']}',
          name: result['data']['name'],
          email: result['data']['email'],
          phone: result['data']['phone'],
          country: result['data']['country'],
          token: 'Bearer ${parsed['data']['access_token']}',
          profilePhoto: result['data']['profile_picture'],
          verified: result['data']['is_verified'] == '1',
          dob: result['data']['dob'],
          city: result['data']['city'],
          state: result['data']['state'],
          address: result['data']['address'],
          bloodgroup: result['data']['blood_group'],
          zip_code: result['data']['zip_code'],
          created_at: result['data']['created_at'],
          onboarded: parsed['data']['onboarded'] == '1'
        );
        box.put(USERPATH, user).then((value) => getReferral(parsed['data']['access_token']));
      } else {
        setState(() {
          isLoading = false;
        });
        final parsed = jsonDecode(res.body);
        popupMessage.dialogMessage(
            context,
            popupMessage.serviceMessage(context, parsed['message'],
                status: false));
      }
    } on SocketException {
      setState(() {
        isLoading = false;
      });
      popupMessage.dialogMessage(
          context,
          popupMessage.serviceMessage(
              context, 'Please check internect connection',
              status: false));
    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  getReferral(token) async {
    var request = http.Request('GET', Uri.parse('${ROOTAPI}/api/v1/auth/patient/referral/code'));
    request.headers.addAll({'Authorization': 'Bearer ' + token});
    http.StreamedResponse response = await request.send();
    if(response.statusCode == 200) {
      response.stream.bytesToString().then((value) {
          final ref = ReferralModel.fromJson(jsonDecode(value));
          refbox.put(USERPATH, jsonEncode(ref.toJson())).then((value) {
            //Get.offAll(() => DashBoard())
          });
      });
    } else{
      popupMessage.dialogMessage(context, popupMessage.serviceMessage(context, response.reasonPhrase, status: false));
    }
  }
}
