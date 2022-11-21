import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';

class FilterPage extends StatefulWidget {
  final String filterType;
  const FilterPage(this.filterType, {Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var selectedDate = DateTime.now();
  String gender = 'male';
  List<String> specialist = [];
  List CONSULT_TYPE = [
    {'title': 'Audio Call', 'icon': Icons.spatial_audio},
    {'title': 'Video Call', 'icon': FontAwesome5.video},
    {'title': 'Chat', 'icon': FontAwesome5.facebook_messenger},
    {'title': 'Physical Visit', 'icon': FontAwesome5.walking}
  ];
  String type = 'Audio Call';
  String shift = 'Morning';
  String bookingClass = 'Standard';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(
                'Filter',
                style: getCustomFont(size: 18.0, color: Colors.black54),
              ),
            ),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.cancel_outlined,
                  size: 20.0,
                  color: Colors.black,
                ))
          ]),
          Divider(),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Date',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                getDateForm(DateFormat('yyyy-MM-dd').format(selectedDate),
                    () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101));
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                }),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Gender',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      getGenderForm('assets/imgs/male.png', 'Male'),
                      const SizedBox(
                        width: 20.0,
                      ),
                      getGenderForm('assets/imgs/female.png', 'Female'),
                      const SizedBox(
                        width: 20.0,
                      ),
                      getGenderForm('assets/imgs/female.png', 'Not Say'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Booking Type',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [...CONSULT_TYPE.map((e) => _dashTypeList(e))],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Consultation Shift',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...consultationShift.map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                shift = e;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              margin: const EdgeInsets.only(
                                  right: 15.0, left: 10.0),
                              decoration: BoxDecoration(
                                  color: shift == e ? BLUECOLOR : Colors.white,
                                  border: Border.all(
                                      color:
                                          shift == e ? BLUECOLOR : Colors.black,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(
                                  child: Text(
                                    '$e',
                                    style: getCustomFont(
                                        size: 12.0,
                                        color: shift == e
                                            ? Colors.white
                                            : BLUECOLOR),
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Booking Class',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...bookClass.map((e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                bookingClass = e;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              margin: const EdgeInsets.only(
                                  right: 15.0, left: 10.0),
                              decoration: BoxDecoration(
                                  color: bookingClass == e
                                      ? BLUECOLOR
                                      : Colors.white,
                                  border: Border.all(
                                      color: bookingClass == e
                                          ? BLUECOLOR
                                          : Colors.black,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(
                                  child: Text(
                                    '$e',
                                    style: getCustomFont(
                                        size: 12.0,
                                        color: bookingClass == e
                                            ? Colors.white
                                            : BLUECOLOR),
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Select Doctor Country',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                getDropDownCountry((s) {
                  print(s);
                }),
                widget.filterType == 'Specialization'
                    ? filterSpecilizationType()
                    : widget.filterType == 'Treatment'
                        ? filterTreatmentType()
                        : widget.filterType == 'Hospital/Clinic'
                            ? filterHospitalType()
                            : widget.filterType == 'Diagnosis Test'
                                ? filterDiagnosisType()
                                : widget.filterType == 'Surgery/transplant'
                                    ? filterSurgeryAndTransType()
                                    : filterServicesType(),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Select Doctor Price',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                getDropDownAssurance(doctorPrice, '0 – 2500'),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Select Doctor Experience',
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black,
                        weight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 9.0,
                ),
                getDropDownAssurance(doctorsExperience, '1-3 Years'),
                const SizedBox(
                  height: 30.0,
                ),
                getButton(context, () {}),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget getButton(context, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: Text(
              'Apply Filter',
              style: getCustomFont(
                  size: 14.0, color: Colors.white, weight: FontWeight.normal),
            ),
          ),
        ),
      );

  getDateForm(text, callBack) => Container(
        height: 54.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.white,
        ),
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
                      horizontal: 10.0, vertical: 10.0),
                  child: Icon(
                    Icons.calendar_month,
                    size: 18.0,
                    color: Color(0xFF838383),
                  ),
                ),
              ),
            )
          ],
        ),
      );

  getGenderForm(asset, text) => Container(
        height: 54.0,
        width: 165.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Image.asset(
                    '$asset',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text('$text',
                      style: getCustomFont(size: 13.0, color: BLUECOLOR)),
                ],
              ),
            )),
            Radio(
                value: gender == '$text'.toLowerCase(),
                groupValue: true,
                onChanged: (b) =>
                    setState(() => gender = '$text'.toLowerCase()))
          ],
        ),
      );

  getDropDownAssurance(List<String> list, text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 49.0,
      decoration: BoxDecoration(
          color: BLUECOLOR.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0)),
      child: FormBuilderDropdown(
        name: 'specialization',
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
        initialValue: '$text',
        items: list
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: getCustomFont(size: 13.0, color: Colors.black45),
                  ),
                ))
            .toList(),
      ),
    );
  }

  getDropDownCountry(onChange) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 49.0,
      decoration: BoxDecoration(
          color: BLUECOLOR.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0)),
      child: FormBuilderDropdown(
        name: 'specialization',
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        onChanged: (s) => onChange(s),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide.none),
        ),
        items: countryListDrop
            .map((e) => DropdownMenuItem<Map<String, dynamic>>(
                  value: e,
                  child: Text(
                    e['name'],
                    style: getCustomFont(size: 13.0, color: Colors.black45),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _dashTypeList(e) => GestureDetector(
        onTap: () => setState(() => type = e['title']),
        child: Container(
            margin: const EdgeInsets.only(right: 5.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
            decoration: BoxDecoration(
                color: type == e['title'] ? BLUECOLOR : Colors.transparent,
                borderRadius: BorderRadius.circular(50.0)),
            child: Row(
              children: [
                Icon(
                  e['icon'],
                  color: type == e['title'] ? Colors.white : Colors.black,
                  size: 14.0,
                ),
                const SizedBox(width: 10),
                Text(
                  '${e['title']}',
                  style: getCustomFont(
                      size: 14.0,
                      color: type == e['title'] ? Colors.white : Colors.black,
                      weight: FontWeight.normal),
                ),
              ],
            )),
      );

  getSpecialistForm(text) => Container(
        height: 45.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: const Color(0xFFE8E8E8), width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Radio(
                value: specialist.contains('$text'.toLowerCase()),
                groupValue: true,
                onChanged: (b) {
                  int i = specialist.indexWhere((element) =>
                      element.toLowerCase() == '$text'.toLowerCase());
                  if (i < 0) {
                    specialist.add('$text'.toLowerCase());
                  } else {
                    specialist.removeAt(i);
                  }
                  setState(() {});
                }),
            Flexible(
                child: Text('$text',
                    style: getCustomFont(size: 13.0, color: Colors.black45))),
          ],
        ),
      );

  Widget filterSpecilizationType() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Specialist',
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          getDropDownAssurance(SpecialitiesFilter, 'Audiologist'),
        ],
      );

  Widget filterTreatmentType() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Treatment',
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          getDropDownAssurance(treatmentList, 'Allergist'),
        ],
      );

  Widget filterHospitalType() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Hospital/Clinics',
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          getDropDownAssurance(
              HospitalClinic, 'First Consultants Medical Centre'),
        ],
      );

  Widget filterServicesType() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Service Type',
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          getDropDownAssurance(ServicesList, 'Dental & Tooth Cleaning'),
        ],
      );

  Widget filterSurgeryAndTransType() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Surgery And Trnsplant Type',
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          getDropDownAssurance(
              SurgeryAndTrans, 'Zenith Medical & Kidney Centre'),
        ],
      );

  Widget filterDiagnosisType() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Select Diagnosis Type',
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 9.0,
          ),
          getDropDownAssurance(DiagnosisTest, 'Vcare Diagnosis Limited'),
        ],
      );
}
