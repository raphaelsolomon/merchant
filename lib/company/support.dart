import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:provider/provider.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            width: MediaQuery.of(context).size.width,
            color: BLUECOLOR,
            child: Column(children: [
              const SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => context.read<HomeController>().onBackPress(),
                      child: Icon(Icons.arrow_back_ios,
                          size: 18.0, color: Colors.white)),
                  Text('Contact Us',
                      style: getCustomFont(size: 15.0, color: Colors.white)),
                  Icon(
                    null,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
            height: 15.0,
          ),
            ]),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    'assets/auth/1.jpeg',
                    width: 200,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Write us your queries',
                    textAlign: TextAlign.center,
                    style: getCustomFont(
                        size: 23.0,
                        color: Colors.black87,
                        weight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'we will get back to you soon',
                    textAlign: TextAlign.center,
                    style: getCustomFont(
                        size: 13.0,
                        color: Colors.black45,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  getFormBox('Subject', 'Complaint'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  getFormBox('Your Name', 'John Doe'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  getFormBox('Your Email', 'username@examplae.com'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  getPhoneNumberForm(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  getFormBox('Message', 'Your Message', max: null, type: TextInputType.multiline, h: 100),
                  const SizedBox(
                    height: 40.0,
                  ),
                  getButton(context, () {}, 'Submit'),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ))
        ]));
  }

  getPhoneNumberForm({ctl}) => Padding(
    padding: const EdgeInsets.symmetric(horizontal :10.0),
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mobile',
              style: getCustomFont(
                  size: 14.0, color: Colors.black45, weight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Container(
              height: 45.0,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.transparent),
                color: BLUECOLOR.withOpacity(.05),
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: PhoneFormField(
                  key: Key('phone-field'),
                  controller: ctl, // controller & initialValue value
                  shouldFormat: true, // default
                  defaultCountry: IsoCode.NG, // default
                  style: getCustomFont(size: 14.0, color: Colors.black45),
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      hintText: 'Mobile Number', // default to null
                      hintStyle: getCustomFont(size: 15.0, color: Colors.black45),
                      border: OutlineInputBorder(
                          borderSide: BorderSide
                              .none) // default to UnderlineInputBorder(),
                      ),
                  validator: null,
                  isCountryChipPersistent: false, // default
                  isCountrySelectionEnabled: true, // default
                  countrySelectorNavigator: CountrySelectorNavigator.dialog(),
                  showFlagInInput: true, // default
                  flagSize: 15, // default
                  autofillHints: [
                    AutofillHints.telephoneNumber
                  ], // default to null
                  enabled: true, // default
                ),
              ),
            ),
          ],
        ),
  );

  getFormBox(text, hint, {ctl, max, h = 45.0, type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$text',
            style: getCustomFont(
                size: 14.0, color: Colors.black45, weight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            height: h,
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.transparent),
                color: BLUECOLOR.withOpacity(.05),
                borderRadius: BorderRadius.circular(5.0)
              ),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    style: getCustomFont(size: 14.0, color: Colors.black87),
                    maxLines: max,
                    keyboardType: type,
                    controller: ctl,
                    decoration: InputDecoration(
                        hintText: hint,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        hintStyle:
                            getCustomFont(size: 14.0, color: Colors.black87),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(0.0))),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
