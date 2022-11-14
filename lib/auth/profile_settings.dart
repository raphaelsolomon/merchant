import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  var selectedDate = DateTime.now();
  String index = 'Basic Info';
  String pricing = 'Free';
  List education = [];
  List experience = [];
  List award = [];
  List membership = [];
  List regList = [];
  List<String> headers = [
    'Basic Info',
    'About Me',
    'Clinic Info',
    'Contact Details',
    'Pricing & Services',
    'Education & Experience',
    'Awards & Memberships',
    'Registration'
  ];
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
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18.0,
                      )),
                  Text('Profile Settings',
                      style: getCustomFont(color: Colors.white, size: 16.0)),
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
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [...headers.map((e) => _dashList(e)).toList()],
              ),
            ),
          ),
          Expanded(
              child: index == 'Basic Info'
                  ? basicInfo()
                  : index == 'About Me'
                      ? aboutMe()
                      : index == 'Clinic Info'
                          ? clinicInfo()
                          : index == 'Contact Details'
                              ? addressInfo()
                              : index == 'Pricing & Services'
                                  ? pricingServices()
                                  : index == 'Education & Experience'
                                      ? educationExperience()
                                      : index == 'Awards & Memberships'
                                          ? awardAndMemberShip()
                                          : registration())
        ]));
  }

  Widget _dashList(e) => GestureDetector(
        onTap: () => setState(() => index = e),
        child: Container(
            margin: const EdgeInsets.only(right: 5.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: index == e ? BLUECOLOR : Colors.transparent,
                borderRadius: BorderRadius.circular(50.0)),
            child: Text(
              '$e',
              style: getCustomFont(
                  size: 14.0,
                  color: index == e ? Colors.white : Colors.black,
                  weight: FontWeight.normal),
            )),
      );

  getCardForm(label, hint, {ctl, index, isList = false, items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '$label',
                style: getCustomFont(
                    size: 13.0,
                    color: Colors.black54,
                    weight: FontWeight.normal),
              ),
            ),
            isList
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20.0,
                    ))
                : SizedBox(),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          height: 45.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade200),
              color: Colors.transparent),
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
    );
  }

  getRichTextForm(label, hint, {ctl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: getCustomFont(
              size: 13.0, color: Colors.black54, weight: FontWeight.normal),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey.shade200),
              color: Colors.transparent),
          child: TextField(
            style: getCustomFont(size: 14.0, color: Colors.black45),
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                hintStyle: getCustomFont(size: 12.0, color: Colors.black45),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ],
    );
  }

  getDropDownAssurance(label, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: getCustomFont(
              size: 13.0, color: Colors.black54, weight: FontWeight.normal),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(8.0)),
          child: FormBuilderDropdown(
            name: 'gender',
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide.none),
            ),
            initialValue: 'Male',
            items: ['Male', 'Female']
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(
                        gender,
                        style: getCustomFont(size: 13.0, color: Colors.black45),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget getButton(context, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: Text(
              'Next',
              style: getCustomFont(
                  size: 14.0, color: Colors.white, weight: FontWeight.normal),
            ),
          ),
        ),
      );

  Widget getDateForm(label, text, callBack) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: getCustomFont(
                size: 13.0, color: Colors.black54, weight: FontWeight.normal),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            height: 45.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade200),
                color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('$text',
                      style: getCustomFont(size: 13.0, color: Colors.black45)),
                )),
                GestureDetector(
                  onTap: () => callBack(),
                  child: PhysicalModel(
                    elevation: 10.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9.0, vertical: 9.0),
                      child: Icon(
                        Icons.calendar_month,
                        size: 17.0,
                        color: Color(0xFF838383),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  //====================page 1=============================
  Widget basicInfo() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Basic Information',
                  style: getCustomFont(size: 17.0, color: Colors.black),
                )),
            const SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/imgs/1.png'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            getCardForm('Username', 'JohnDoe98'),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Full Name', 'John'),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Last Name', 'Doe'),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('phone Number', ''),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('E-mail Address', 'Johndoe55@gmail.com'),
            const SizedBox(
              height: 15.0,
            ),
            getDropDownAssurance('Gender', context),
            const SizedBox(
              height: 15.0,
            ),
            getDateForm('Date of Birth',
                DateFormat('dd EEEE, MMM, yyyy').format(selectedDate), () {}),
            const SizedBox(
              height: 30.0,
            ),
            getButton(context, () {}),
            const SizedBox(
              height: 10.0,
            ),
          ]),
        ),
      );

  Widget aboutMe() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'About Me',
                  style: getCustomFont(size: 17.0, color: Colors.black),
                )),
            const SizedBox(
              height: 20.0,
            ),
            getRichTextForm(
              'Biography',
              'Within 400 character',
            ),
            const SizedBox(
              height: 30.0,
            ),
            getButton(context, () {}),
            const SizedBox(
              height: 10.0,
            ),
          ]),
        ),
      );

  Widget clinicInfo() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Clinic Information',
                  style: getCustomFont(size: 17.0, color: Colors.black),
                )),
            const SizedBox(
              height: 20.0,
            ),
            getCardForm('Clinic Name', ''),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Clinic Address', ''),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              'Clinic images',
              style: getCustomFont(
                  size: 13.0, color: Colors.black54, weight: FontWeight.normal),
            ),
            const SizedBox(
              height: 5.0,
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(8.0),
              dashPattern: [8, 4],
              strokeCap: StrokeCap.butt,
              color: Colors.black45,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade200),
                child: Center(
                  child: Text('Click her to upload images',
                      style: getCustomFont(
                        size: 13.0,
                        color: Colors.black45,
                        weight: FontWeight.normal,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            getButton(context, () {}),
            const SizedBox(
              height: 10.0,
            ),
          ]),
        ),
      );

  Widget addressInfo() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Contact Details',
                  style: getCustomFont(size: 17.0, color: Colors.black),
                )),
            const SizedBox(
              height: 30.0,
            ),
            getCardForm('Address 1', 'JohnDoe98'),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Address 2', 'John'),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('City', 'Doe'),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('State / Province', ''),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Country', 'Postal Code'),
            const SizedBox(
              height: 30.0,
            ),
            getButton(context, () {}),
            const SizedBox(
              height: 10.0,
            ),
          ]),
        ),
      );

  Widget pricingServices() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Pricing',
                  style: getCustomFont(size: 17.0, color: Colors.black),
                )),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Flexible(
                    child: Row(
                  children: [
                    Radio(
                        value: pricing == 'Free',
                        groupValue: true,
                        onChanged: (b) {
                          setState(() {
                            pricing = 'Free';
                          });
                        }),
                    Text(
                      'Free',
                      style: getCustomFont(size: 12.0, color: Colors.black45),
                    )
                  ],
                )),
                Flexible(
                    child: Row(
                  children: [
                    Radio(
                        value: pricing == 'Custom Price (per hour)',
                        groupValue: true,
                        onChanged: (b) {
                          setState(() {
                            pricing = 'Custom Price (per hour)';
                          });
                        }),
                    Flexible(
                      child: FittedBox(
                        child: Text(
                          'Custom Price (per hour)',
                          style:
                              getCustomFont(size: 13.0, color: Colors.black45),
                        ),
                      ),
                    )
                  ],
                )),
              ],
            ),
            getCardForm('', ''),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Services', ''),
            const SizedBox(
              height: 15.0,
            ),
            getCardForm('Specialization', ''),
            const SizedBox(
              height: 30.0,
            ),
            getButton(context, () {}),
            const SizedBox(
              height: 10.0,
            ),
          ]),
        ),
      );

  Widget educationExperience() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Education',
                      style: getCustomFont(size: 17.0, color: Colors.black),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                getCardForm('Degree', ''),
                const SizedBox(
                  height: 15.0,
                ),
                getCardForm('Year of Completion', ''),
                const SizedBox(
                  height: 15.0,
                ),
                getCardForm('College/Institute', ''),
                const SizedBox(
                  height: 10.0,
                ),
                ...List.generate(
                    education.length, (i) => getEducationItem(education[i], i)),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () => setState(() => education.add({
                          'degree': TextEditingController(),
                          'college': TextEditingController(),
                          'year': TextEditingController()
                        })),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: BLUECOLOR,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Experience',
                      style: getCustomFont(size: 17.0, color: Colors.black),
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                getCardForm('Hospital Name', '', ctl: null),
                const SizedBox(
                  height: 15.0,
                ),
                getCardForm('From', '', ctl: null),
                const SizedBox(
                  height: 15.0,
                ),
                getCardForm('To', '', ctl: null),
                const SizedBox(
                  height: 10.0,
                ),
                ...List.generate(experience.length,
                    (i) => getExperienceItem(experience[i], i)),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () => setState(() => experience.add({
                          'name': TextEditingController(),
                          'from': TextEditingController(),
                          'to': TextEditingController()
                        })),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: BLUECOLOR,
                    )),
                const SizedBox(
                  height: 30.0,
                ),
                getButton(context, () {}),
                const SizedBox(
                  height: 10.0,
                ),
              ]),
        ),
      );

  Widget awardAndMemberShip() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Awards',
                      style: getCustomFont(size: 17.0, color: Colors.black),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                getCardForm('Award', ''),
                const SizedBox(
                  height: 15.0,
                ),
                getCardForm('Year', ''),
                const SizedBox(
                  height: 10.0,
                ),
                ...List.generate(
                    award.length, (i) => getAwardItem(award[i], i)),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () => setState(() => award.add({
                          'award': TextEditingController(),
                          'year': TextEditingController()
                        })),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: BLUECOLOR,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Memberships',
                      style: getCustomFont(size: 17.0, color: Colors.black),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                getCardForm('Memberships', '', ctl: null),
                const SizedBox(
                  height: 10.0,
                ),
                ...List.generate(membership.length,
                    (i) => getMemberShipItem(membership[i], i)),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () => setState(() => membership
                        .add({'membership': TextEditingController()})),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: BLUECOLOR,
                    )),
                const SizedBox(
                  height: 30.0,
                ),
                getButton(context, () {}),
                const SizedBox(
                  height: 10.0,
                ),
              ]),
        ),
      );

  Widget registration() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Awards',
                      style: getCustomFont(size: 17.0, color: Colors.black),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                getCardForm('Registrations', ''),
                const SizedBox(
                  height: 10.0,
                ),
                getCardForm('Year', ''),
                const SizedBox(
                  height: 10.0,
                ),
                ...List.generate(
                    regList.length, (i) => getRegistrationItem(regList[i], i)),
                const SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                    onTap: () => setState(() => regList.add({
                          'registration': TextEditingController(),
                          'year': TextEditingController()
                        })),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: BLUECOLOR,
                    )),
                const SizedBox(
                  height: 30.0,
                ),
                getButton(context, () {}),
                const SizedBox(
                  height: 10.0,
                ),
              ]),
        ),
      );

  //====================EducationItem======================
  Widget getEducationItem(e, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getCardForm('Degree', '',
              ctl: e['degree'], isList: true, items: education, index: i),
          const SizedBox(
            height: 15.0,
          ),
          getCardForm('Year of Completion', '', ctl: e['college']),
          const SizedBox(
            height: 15.0,
          ),
          getCardForm('College/Institute', '', ctl: e['year']),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget getExperienceItem(e, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getCardForm('Hospital Name', '',
              ctl: e['name'], isList: true, items: experience, index: i),
          const SizedBox(
            height: 15.0,
          ),
          getCardForm('From', '', ctl: e['from']),
          const SizedBox(
            height: 15.0,
          ),
          getCardForm('To', '', ctl: e['to']),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget getAwardItem(e, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getCardForm('Award', '',
              ctl: e['award'], isList: true, items: award, index: i),
          const SizedBox(
            height: 15.0,
          ),
          getCardForm('Year', '', ctl: e['year']),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget getMemberShipItem(e, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getCardForm('Memberships', '',
              ctl: e['membership'], isList: true, items: membership, index: i),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget getRegistrationItem(e, i) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      getCardForm('Registrations', '',
          ctl: e['registration'], isList: true, items: regList, index: i),
      const SizedBox(
        height: 15.0,
      ),
      getCardForm('Year', '', ctl: e['year']),
      const SizedBox(
        height: 15.0,
      ),
    ],
  );
}
