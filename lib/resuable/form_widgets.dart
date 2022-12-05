import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/curreency.dart';
import 'package:merchant/dialog/edit_add_product.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/store/index.dart';
import 'package:merchant/store/product_details.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:provider/provider.dart';

getRegisterForm(
        {ctl,
        obscure = false,
        hint,
        icon = Icons.email_outlined,
        cp,
        height = 54.0}) =>
    Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
            controller: ctl,
            obscureText: obscure,
            keyboardType: TextInputType.text,
            style: getCustomFont(size: 15.0, color: Colors.black45),
            decoration: InputDecoration(
                hintText: obscure
                    ? cp != null
                        ? 'Confirm Password'
                        : 'password'
                    : hint == null
                        ? 'johndoe@example.com'
                        : hint,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                hintStyle: getCustomFont(size: 15.0, color: Colors.black45),
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          )),
          PhysicalModel(
            elevation: 10.0,
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
            shadowColor: Colors.grey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Icon(
                icon,
                size: 18.0,
                color: Color(0xFF838383),
              ),
            ),
          )
        ],
      ),
    );

getRegisterPasswordForm({ctl, hint}) => Container(
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
              child: TextFormField(
            controller: ctl,
            obscureText: true,
            keyboardType: TextInputType.text,
            style: getCustomFont(size: 15.0, color: Colors.black45),
            decoration: InputDecoration(
                hintText: hint,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                hintStyle: getCustomFont(size: 15.0, color: Colors.black45),
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          )),
          PhysicalModel(
            elevation: 10.0,
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
            shadowColor: Colors.grey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Icon(
                Icons.lock_outlined,
                size: 18.0,
                color: Color(0xFF838383),
              ),
            ),
          )
        ],
      ),
    );

getCountryForm({ctl, text = 'Nigeria'}) => Container(
      height: 54.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              '$text',
              style: getCustomFont(size: 15.0, color: Colors.black45),
            ),
          )),
          PhysicalModel(
            elevation: 10.0,
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
            shadowColor: Colors.grey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Icon(
                FontAwesome5.globe,
                size: 18.0,
                color: Color(0xFF838383),
              ),
            ),
          )
        ],
      ),
    );

getPhoneNumberForm({ctl}) => Container(
      height: 54.0,
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Flexible(
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
                      borderSide:
                          BorderSide.none) // default to UnderlineInputBorder(),
                  ),
              validator: null,
              isCountryChipPersistent: false, // default
              isCountrySelectionEnabled: true, // default
              countrySelectorNavigator: CountrySelectorNavigator.dialog(),
              showFlagInInput: true, // default
              flagSize: 15, // default
              autofillHints: [AutofillHints.telephoneNumber], // default to null
              enabled: true, // default
            ),
          )),
          PhysicalModel(
            elevation: 10.0,
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
            shadowColor: Colors.grey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Icon(
                Icons.smartphone,
                size: 18.0,
                color: Color(0xFF838383),
              ),
            ),
          )
        ],
      ),
    );

Widget socialAccount(icon, color, {callBack}) => GestureDetector(
      onTap: () => callBack(),
      child: Container(
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0), color: color),
      ),
    );

getButton(context, callBack,
        {text = 'Sign In', color = BLUECOLOR, textcolor = Colors.white}) =>
    GestureDetector(
      onTap: () => callBack(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45.0,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 17.0,
                  color: textcolor,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );

getOtpForm({ctl, node, onChange}) => Container(
      width: 55.0,
      height: 45.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: TextFormField(
        controller: ctl,
        focusNode: node,
        style: getCustomFont(
            size: 16.0, color: Colors.black, weight: FontWeight.w500),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (s) => onChange(s),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.numberWithOptions(decimal: false),
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.0))),
      ),
    );

navDrawer(BuildContext context, scaffold, box) => Container(
      width: (MediaQuery.of(context).size.width / 2) + 78.0,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            color: BLUECOLOR,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                  onTap: () => scaffold.currentState!.closeDrawer(),
                  child: Icon(Icons.keyboard_backspace, color: Colors.white)),
              const SizedBox(
                height: 7.0,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<HomeController>().setPage(-2);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                      child: Text(
                    'John Deo',
                    style: GoogleFonts.poppins(
                        fontSize: 15.0, color: Colors.white),
                  ))
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...getNavdraweritem_(context).map((e) {
                    if (e.children.isEmpty) {
                      return InkWell(
                        onTap: () {
                          scaffold.currentState!.closeDrawer();
                          setClickListener(e, context);
                        },
                        child: Container(
                          height: 45.0,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundColor: BLUECOLOR,
                              radius: 18.0,
                              child: Icon(
                                e.icon,
                                color: Colors.white,
                                size: 15.0,
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Flexible(
                                child: Text(
                              e.title,
                              style: GoogleFonts.poppins(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87.withOpacity(.7)),
                            ))
                          ]),
                        ),
                      );
                    }
                    return ExpansionTile(
                        tilePadding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 5.0),
                        leading: CircleAvatar(
                          radius: 18.0,
                          backgroundColor: BLUECOLOR,
                          child: Icon(
                            e.icon,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                        title: Text(
                          e.title,
                          style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87.withOpacity(.7)),
                        ),
                        children: e.children.map((entries) {
                          return GestureDetector(
                            onTap: () =>
                                setChildrenClickListener(entries, context),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 13.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(entries['title'],
                                    style: getCustomFont(
                                        size: 14.0,
                                        color: Colors.black87.withOpacity(.7))),
                              ),
                            ),
                          );
                        }).toList());
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );

setChildrenClickListener(e, BuildContext context) {
  switch (e['index'] as int) {
    case 4:
      context.read<HomeController>().isEstore(true);
      context.read<HomeController>().setStoreIndex(0);
      Get.to(() => StorePage(4));
      break;
    case 5:
      context.read<HomeController>().setPage(5);
      break;
    case -5:
      context.read<HomeController>().setPage(-5);
      break;
    case 7:
      context.read<HomeController>().setPage(7);
      break;
    case -7:
      context.read<HomeController>().setPage(-7);
      break;
    case 9:
      context.read<HomeController>().setPage(9);
      break;
    case 10:
      context.read<HomeController>().setPage(10);
      break;
    case 11:
      context.read<HomeController>().setPage(11);
      break;
    case 12:
      context.read<HomeController>().setPage(12);
      break;
    case 13:
      context.read<HomeController>().setPage(13);
      break;
    case 14:
      context.read<HomeController>().setPage(14);
      break;
    case 15:
      context.read<HomeController>().setPage(15);
      break;
    case 16:
      context.read<HomeController>().setPage(16);
      break;
    case 17:
      context.read<HomeController>().setPage(17);
      break;
    case 19:
      context.read<HomeController>().setPage(19);
      break;
    case 20:
      context.read<HomeController>().setPage(20);
      break;
    case 21:
      context.read<HomeController>().setPage(21);
      break;
    case 23:
      dialogMessage(context, CurrencyDialog());
      break;
    case 22:
      context.read<HomeController>().setPage(22);
      break;
  }
}

setClickListener(e, BuildContext context) {
  switch (e.index) {
    case 0:
      context.read<HomeController>().jumpToHome();
      break;
    case 1:
      context.read<HomeController>().setPage(1);
      break;
    case 2:
      context.read<HomeController>().setPage(2);
      break;
    case 3:
      context.read<HomeController>().setPage(3);
      break;
    case 4:
      context.read<HomeController>().isEstore(true);
      context.read<HomeController>().setStoreIndex(0);
      Get.to(() => StorePage(0));
      break;
    case 11:
      dialogMessage(context, logoutPop(context));
      break;
    case 23:
      context.read<HomeController>().setPage(23);
      break;
    default:
      context.read<HomeController>().jumpToHome();
      break;
  }
}

Widget dropDown({list, text, label}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$text',
            style: getCustomFont(size: 12.0, color: Colors.black),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 45.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: FormBuilderDropdown(
                    name: 'skill',
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      label: Text(
                        '$label',
                        style: getCustomFont(size: 12.0, color: Colors.black),
                      ),
                      labelStyle:
                          getCustomFont(size: 12.0, color: Colors.black),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 9.9, vertical: 5.0),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    // initialValue: 'Male',
                    items: ['boy', 'girl', 'man', 'woman']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(
                                gender,
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
        ],
      ),
    );

Widget createPrescriptionButton(BuildContext context, icon, text, {callBack}) =>
    Container(
      width: MediaQuery.of(context).size.width,
      height: 45.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.grey.shade200),
      child: Row(
        children: [
          Icon(
            icon,
            size: 19.0,
            color: Colors.black45,
          ),
          const SizedBox(
            width: 18.0,
          ),
          Text(
            text,
            style: getCustomFont(
                size: 15.0, color: Colors.black, weight: FontWeight.w500),
          )
        ],
      ),
    );

getCouponCode(context, {ctl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              style: getCustomFont(size: 14.0, color: Colors.black45),
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Coupon Code',
                  contentPadding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 3.0),
                  hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
              color: BLUECOLOR,
            ),
            child: Center(
                child: Text(
              'Apply',
              style: getCustomFont(size: 15.0, color: Colors.white),
            )),
          )
        ],
      ),
    ),
  );
}

Widget getCardForm(hint, {ctl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Container(
      height: 48.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade200),
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.search,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Flexible(
            child: TextField(
              style: getCustomFont(size: 14.0, color: Colors.black45),
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget firstScroll(e) => Container(
      width: 130,
      height: 170,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: e['color']),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${e['title']}',
            style: getCustomFont(
                size: 15.0, color: Colors.white, weight: FontWeight.bold),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              '${e['icon']}',
              width: 50.0,
              height: 55.0,
            ),
          ))
        ],
      ),
    );

Widget secondScroll(context, e) => Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: 110,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: e['color'],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                e['title'],
                style: getCustomFont(
                    size: 17.0, color: Colors.white, weight: FontWeight.w500),
              )),
          Image.asset(
            '${e['icon']}',
            height: double.infinity,
          )
        ],
      ),
    );

Widget thirdScroll(context, e) => GestureDetector(
      //onTap: () => Get.to(() => ProductList()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: e['color']),
            child: Center(
              child: Image.asset(
                '${e['icon']}',
                width: 30.0,
                height: 30.0,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                    child: Text(
                  '${e['title']}',
                  style: getCustomFont(
                      color: Colors.black, size: 14.0, weight: FontWeight.w500),
                )),
                const SizedBox(
                  height: 1.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black45,
                      size: 12.0,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                        child: FittedBox(
                            child: Text(
                      '${e['desc']}',
                      style: getCustomFont(
                          color: Colors.black45,
                          size: 12.0,
                          weight: FontWeight.normal),
                    ))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

int returnCrossAxis(width) {
  return width < 500
      ? 2
      : width > 500 && width < 100
          ? 2
          : 3;
}

int returnBrandCrossAxis(width) {
  return width < 500
      ? 3
      : width > 500 && width < 100
          ? 3
          : 5;
}

Widget createPrescriptionNote(text) => Row(
      children: [
        Icon(
          Icons.radio_button_checked,
          size: 19.0,
          color: BLUECOLOR,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Flexible(
            child: FittedBox(
                child: Text(
          text,
          style: getCustomFont(
              size: 14.0, color: Colors.black, weight: FontWeight.w500),
        )))
      ],
    );

dashWidget(context,
    {icon = FontAwesome5.calendar_day,
    text = "Total Customers",
    progress = 0.8,
    result = '1300+',
    color = BLUECOLOR}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        boxShadow: SHADOW,
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white),
    child: Column(children: [
      SizedBox(
        width: 100,
        height: 100,
        child: CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 8.0,
          percent: 0.5,
          center: Image.asset(
            'assets/imgs/patient.png',
            height: 35.0,
            width: 35.0,
            fit: BoxFit.contain,
          ),
          backgroundColor: Colors.grey.shade100,
          progressColor: Colors.lightBlueAccent.withOpacity(.7),
        ),
      ),
      const SizedBox(
        height: 7.0,
      ),
      Text(
        '$text',
        style: getCustomFont(
            size: 14.0, color: Colors.black, weight: FontWeight.w500),
      ),
      const SizedBox(
        height: 3.0,
      ),
      Text(
        '$result',
        style: getCustomFont(
            size: 17.0, color: Colors.black54, weight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 9.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.green.shade300),
        child: FittedBox(
          child: Text(
            'March 18, 2022',
            style: getCustomFont(size: 13.0, color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 4.0,
      ),
    ]),
  );
}

appointmentButton(context, text) => Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18.0),
      decoration: BoxDecoration(
        color: BLUECOLOR,
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Center(
          child: Text(
        text,
        textAlign: TextAlign.center,
        style: getCustomFont(size: 11.0, color: Colors.white),
      )),
    );

Widget patientItem(context) => Container(
    padding: const EdgeInsets.all(15.0),
    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: SHADOW),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Patient ID - PT0025',
                style: getCustomFont(
                    color: Colors.black54, size: 12.0, weight: FontWeight.w400),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.location_on, size: 14.0, color: Colors.black),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Flexible(
                    child: Text(
                      'Florida, USA',
                      textAlign: TextAlign.end,
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 12.0,
                          weight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 27.0,
              backgroundImage: AssetImage('assets/imgs/1.png'),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Michelle Fairfax',
                    style: getCustomFont(
                        color: Colors.black,
                        size: 17.0,
                        weight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '25 Years, Female',
                          style: getCustomFont(
                              color: Colors.black54,
                              size: 13.0,
                              weight: FontWeight.w400),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            'Blood Group - O+',
                            style: getCustomFont(
                                color: Colors.black54,
                                size: 12.0,
                                weight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      PhysicalModel(
                        elevation: 10.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 5.0),
                          child: Icon(
                            Icons.phone,
                            size: 19.0,
                            color: Color(0xFF838383),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            '+1 504 368 6874',
                            style: getCustomFont(
                                color: Colors.black54,
                                size: 13.0,
                                weight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    ));

Widget dashHeader(context) => Positioned(
      top: 80.0,
      right: 0,
      left: 0,
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 1.0,
                blurRadius: 10.0,
                offset: Offset(0.0, 1.0))
          ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    'assets/imgs/3.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  )),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Darren Elder',
                      style: getCustomFont(
                          size: 17.0,
                          color: Colors.black,
                          weight: FontWeight.w400),
                    ),
                    FittedBox(
                      child: Text(
                        'BDS, MDS - Oral & Maxillofacial Surgery',
                        style: getCustomFont(
                            size: 12.0,
                            color: Colors.black54,
                            weight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: [
                        PhysicalModel(
                          elevation: 10.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          shadowColor: Colors.grey,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              child: Image.asset(
                                'assets/imgs/tooth.png',
                                width: 15.0,
                                height: 15.0,
                                fit: BoxFit.contain,
                              )),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Dentist',
                          style: getCustomFont(
                              color: Colors.black54,
                              size: 13.0,
                              weight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              '+15 Years Exp.',
                              style: getCustomFont(
                                  size: 13.0,
                                  color: Colors.red,
                                  weight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Text(
                          '(Lagos, Nigeria)',
                          style: getCustomFont(
                              size: 12.0,
                              color: Colors.black45,
                              weight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );

Widget productItem(BuildContext context) => GestureDetector(
      onTap: () => Get.to(() => ProductDetails()),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: SHADOW,
            color: Colors.white),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Center(
                    child: Image.asset('assets/imgs/pills.png'),
                  )),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    'Salospir 200mg Tablet',
                    textAlign: TextAlign.start,
                    style: getCustomFont(size: 14.0, color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    '\$5.50',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 30.0,
                height: 35.0,
                decoration: BoxDecoration(
                    color: BLUECOLOR,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0))),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 19.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
