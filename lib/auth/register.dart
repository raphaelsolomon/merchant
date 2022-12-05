import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:merchant/dialog/subscribe.dart' as popupMessage;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant/auth/login.dart';
import 'package:merchant/auth/otp.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/resources/firebase_method.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/services/request.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({Key? key}) : super(key: key);

  @override
  State<AuthRegister> createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  late PhoneController phoneController;
  bool isEmail = true;
  String country = 'Nigeria';
  String country_id = '161';
  bool isLoading = false;
  String merchantCategory = 'Merchant Category';
  String merchantType = 'Merchant Type';
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void initState() {
    phoneController = PhoneController(null);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      phoneController.addListener(() => setState(() {
            var i = countryList.indexWhere((element) =>
                '+${element['code']}' ==
                '${phoneController.value!.isoCode.name}');
            country = countryList.elementAt(i)['name'];
          }));
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Image.asset('assets/auth/1.jpeg',
                            repeat: ImageRepeat.noRepeat,
                            fit: BoxFit.contain,
                            height: 250),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Text(
                          'Get Started For Free',
                          style: GoogleFonts.poppins(
                              fontSize: 28.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ))
                      ],
                    ),
                    Text(
                      'Sign-up to your account to continue',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0, color: Colors.black45),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    optionButton(context),
                    const SizedBox(
                      height: 15.0,
                    ),
                    getRegisterForm(
                        ctl: fullname,
                        obscure: false,
                        icon: Icons.person,
                        hint: 'Full Name'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    isEmail
                        ? getRegisterForm(
                            ctl: email,
                            icon: Icons.email_outlined,
                            obscure: false,
                            hint: 'Email Address')
                        : getPhoneNumberForm(ctl: phoneController),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () => showBottomSheet(),
                      child: getCountryForm(text: country),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () => showBottomMerchantTypeSheet(),
                      child: getNewDropDown(merchantCategory),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    merchantCategory == 'Customer' ||
                            merchantCategory == 'Vendor'
                        ? GestureDetector(
                            onTap: () => showTypeSheet(),
                            child: getNewDropDown(merchantType),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: merchantCategory == 'Customer' ||
                              merchantCategory == 'Vendor'
                          ? 10.0
                          : 0.0,
                    ),
                    getRegisterForm(
                        ctl: password,
                        icon: Icons.lock_outlined,
                        obscure: true,
                        hint: 'Password'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    getRegisterPasswordForm(
                      ctl: confirmPassword,
                      hint: 'Confirm Password',
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    isLoading
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child:
                                  CircularProgressIndicator(color: BLUECOLOR),
                            ),
                          )
                        : getButton(context, () {
                            validDate();
                          }, text: 'Register'),
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
                                  print(
                                      '${user.user.token.accessToken} - ${user.user.firstName!.localized!.label} - ${user.user.lastName!.localized!.label} - ${user.user.profilePicture!.displayImageContent!.elements!.first.identifiers!.first.identifier} - ${user.user.userId} - ${user.user.email!.elements!.first.handleDeep!.emailAddress}');
                                  // Get.offAll(() => DashBoard());
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
                            'Already have an account?',
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
                          onTap: () => Get.to(() => AuthLogin()),
                          child: Text('Sign In',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  color: BLUECOLOR,
                                  fontWeight: FontWeight.normal)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 46.0,
                    ),
                  ]),
            )));
  }

  void validDate() async {
    if (fullname.text.trim().isEmpty) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'Fullname required'));
      return;
    }

    if (password.text.trim().isEmpty) {
      popupMessage.dialogMessage(
          context, popupMessage.serviceMessage(context, 'password required'));
      return;
    }

    if (confirmPassword.text.trim().isEmpty) {
      popupMessage.dialogMessage(context,
          popupMessage.serviceMessage(context, 'comfirm password required'));
      return;
    }

    if (confirmPassword.text.trim() != password.text.trim()) {
      popupMessage.dialogMessage(
          context,
          popupMessage.serviceMessage(
              context, 'confirm password does not match'));
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
      final res = await http.post(Uri.parse('${ROOTAPI}/api/user/register'),
          body: isEmail
              ? {
                  'email': email.text.trim(),
                  'name': fullname.text.trim(),
                  'category_id': '3',
                  'password': password.text.trim(),
                  'country_id': '$country_id'
                }
              : {
                  'phone':
                      '+${phoneController.value!.countryCode}${phoneController.value!.nsn}',
                  'name': fullname.text.trim(),
                  'category_id': '3',
                  'password': password.text.trim(),
                  'country_id': '$country_id'
                });
      if (res.statusCode == 200) {
        final parsed = jsonDecode(res.body);
        popupMessage.dialogMessage(
            context,
            popupMessage.serviceMessage(context, parsed['message'],
                status: true, cB: () {
              Get.to(() => AuthOtp(
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
      });
    }
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Select Country',
              style: GoogleFonts.poppins(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          countryList.length,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        country =
                                            '${countryList[index]['name']}';
                                        country_id =
                                            '${countryList[index]['id']}';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        '${countryList[index]['name']}',
                                        style: getCustomFont(
                                            size: 16.0, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showBottomMerchantTypeSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'Select Merchant Catergory',
              style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          ['Customer', 'Vendor'].length,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        merchantCategory =
                                            '${['Customer', 'Vendor'][index]}';
                                        merchantType = 'Merchant Type';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Text(
                                        '${['Customer', 'Vendor'][index]}',
                                        style: getCustomFont(
                                            size: 16.0, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showTypeSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Column(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Text(
              'Select Merchant Type',
              style: GoogleFonts.poppins(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                          merchantCategory == 'Customer'
                              ? MERCHANTTYPE.length
                              : VENDORTYPE.length,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        merchantType =
                                            merchantCategory == 'Customer'
                                                ? '${MERCHANTTYPE[index]}'
                                                : '${VENDORTYPE[index]}';
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        merchantCategory == 'Customer'
                                            ? '${MERCHANTTYPE[index]}'
                                            : '${VENDORTYPE[index]}',
                                        style: getCustomFont(
                                            size: 16.0, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                ],
                              ))),
                ),
              ),
            )
          ],
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

  getNewDropDown(text) => Container(
        height: 54.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: const Color(0xFFE8E8E8), width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '$text',
                    style: getCustomFont(size: 14.0, color: Colors.black45),
                  ),
                )),
            PhysicalModel(
              elevation: 10.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.0),
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Icon(
                  Icons.account_box,
                  size: 18.0,
                  color: Color(0xFF838383),
                ),
              ),
            )
          ],
        ),
      );
}
