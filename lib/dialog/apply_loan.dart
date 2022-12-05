import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:merchant/constant/strings.dart';

class Applyloan extends StatefulWidget {
  const Applyloan({Key? key}) : super(key: key);

  @override
  State<Applyloan> createState() => _ApplyloanState();
}

class _ApplyloanState extends State<Applyloan> {
  List<String> operative = [
    'Absolut',
    'Chemiron',
    'Dettol',
    'Emzor',
    'Fidson',
    'GlaxoSmithKline',
    'May & Baker',
    'Mopson',
    'Neros',
    'Nivea',
    'Novatis',
    'Olex',
    'Panadol',
    'Pfizer',
    'Swipha',
    'Takeda',
    'Teva',
    'Zolon',
    '3M',
    'Unilever'
  ];

  String interval = "3";
  String amount = '1000';

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
            child: getDropDownAssurance(
                ['Partial Product Loan', 'Full Product Loan'], (s) {}, context),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
            child: Row(
              children: [
                Flexible(
                    flex: 3,
                    child: getDropDownAssurance(operative, (s) {}, context)),
                const SizedBox(width: 10.0),
                Flexible(child: getPayButton(context, () {}, 'Apply')),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          applyItem(MediaQuery.of(context).size.width),
          const SizedBox(height: 5.0),
          applyItem2(MediaQuery.of(context).size.width),
          const SizedBox(height: 5.0),
          applyItem3(MediaQuery.of(context).size.width),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: getPayButton(context, () {}, 'Request Loan'),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    ));
  }

  Widget getDropDownAssurance(
      List<String> list, callBack, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 45.0,
      decoration: BoxDecoration(
          color: BLUECOLOR.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0)),
      child: FormBuilderDropdown(
        name: 'skill',
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
        initialValue: list[0],
        onChanged: (value) => callBack(value),
        items: list
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: getCustomFont(size: 14.0, color: Colors.black45),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget getPayButton(context, callBack, text) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '$text',
                style: getCustomFont(
                    size: 12.0, color: Colors.white, weight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );

  Widget applyItem(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 0.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: SHADOW,
        ),
        child: Column(children: [
          Text(
            'Select Loan Amount',
            style: getCustomFont(
                size: 13.0, color: Colors.black87, weight: FontWeight.w600),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            'Move the slider to select your loan amount',
            style: getCustomFont(
                size: 12.0, color: Colors.black54, weight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            '\$${amount}',
            style: getCustomFont(
                size: 19.0, color: Colors.black87, weight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Flexible(
                child: FlutterSlider(
                    values: [double.parse(amount)],
                    max: 20000,
                    min: 500,
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      setState(() {
                       amount = '${double.parse('${lowerValue}').toStringAsFixed(2)}';
                      });
                    }),
              )
            ],
          )
        ]),
      );

  Widget applyItem2(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 0.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: SHADOW,
        ),
        child: Column(children: [
          Text(
            'Select Loan Interval',
            style: getCustomFont(
                size: 13.0, color: Colors.black87, weight: FontWeight.w600),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            'Move the slider to select your loan interval',
            style: getCustomFont(
                size: 12.0, color: Colors.black54, weight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            '$interval Days Interval',
            style: getCustomFont(
                size: 19.0, color: Colors.black87, weight: FontWeight.bold),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Row(
            children: [
              Flexible(
                child: FlutterSlider(
                    values: [double.parse(interval)],
                    max: 30,
                    min: 3,
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                     setState(() {
                       interval = '${double.parse('${lowerValue}').toInt()}';
                     });
                    }),
              )
            ],
          )
        ]),
      );

  Widget applyItem3(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 10.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: SHADOW,
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Loan Amount',
                  style: getCustomFont(
                      size: 12.0,
                      color: Colors.black45,
                      weight: FontWeight.w600),
                ),
              ),
              Text(
                '\$${amount}',
                style: getCustomFont(
                    size: 12.0, color: Colors.black87, weight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Loan Interest',
                  style: getCustomFont(
                      size: 12.0,
                      color: Colors.black45,
                      weight: FontWeight.w600),
                ),
              ),
              Text(
                '\$${(double.parse(amount) * 0.05).toStringAsFixed(2)}',
                style: getCustomFont(
                    size: 12.0, color: Colors.black87, weight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Total Loan Repayment',
                  style: getCustomFont(
                      size: 12.0,
                      color: Colors.black45,
                      weight: FontWeight.w600),
                ),
              ),
              Text(
                '\$${((double.parse(amount) * 0.05) + double.parse(amount)).toStringAsFixed(2)}',
                style: getCustomFont(
                    size: 13.0,
                    color: Colors.blueAccent,
                    weight: FontWeight.w600),
              ),
            ],
          ),
        ]),
      );
}
