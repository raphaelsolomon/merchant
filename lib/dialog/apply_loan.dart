import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:merchant/constant/strings.dart';

class Applyloan extends StatelessWidget {
  const Applyloan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: getDropDownAssurance(['Partial Product Loan', 'Full Product Loan'], (s) {}, context),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: Row(
              children: [
                Flexible(
                    child: getDropDownAssurance(['s', 'a'], (s) {}, context)),
                const SizedBox(width: 10.0),
                //getPayButton(context, (){}, 'Apply')
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          applyItem(MediaQuery.of(context).size.width),
          const SizedBox(height: 16.0),
          applyItem2(MediaQuery.of(context).size.width),
          const SizedBox(height: 16.0),
          applyItem3(MediaQuery.of(context).size.width),
          const SizedBox(height: 20.0),
          getPayButton(context, (){},  'Request Loan'),
          const SizedBox(height: 20.0),
        ],
      ),
    ));
  }

  Widget getDropDownAssurance(
      List<String> list, callBack, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 49.0,
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
            padding: const EdgeInsets.all(13.0),
            child: Center(
              child: Text(
                '$text',
                style: getCustomFont(
                    size: 15.0, color: Colors.white, weight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );

  Widget applyItem(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 10.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: SHADOW,
        ),
        child: Row(children: [
          Flexible(
            child: Column(children: [
              Text(
                'Select Loan Amount',
                style: getCustomFont(
                    size: 11.0, color: Colors.black87, weight: FontWeight.w600),
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
                '\$51,000.00',
                style: getCustomFont(
                    size: 17.0, color: Colors.black87, weight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  FlutterSlider(
                      values: [300],
                      max: 500,
                      min: 0,
                      onDragging: (handlerIndex, lowerValue, upperValue) {})
                ],
              )
            ]),
          )
        ]),
      );

  Widget applyItem2(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 10.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: SHADOW,
        ),
        child: Row(children: [
          Flexible(
            child: Column(children: [
              Text(
                'Select Loan Interval',
                style: getCustomFont(
                    size: 11.0, color: Colors.black87, weight: FontWeight.w600),
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
                '\$51,000.00',
                style: getCustomFont(
                    size: 17.0, color: Colors.black87, weight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  FlutterSlider(
                      values: [3],
                      max: 30,
                      min: 3,
                      onDragging: (handlerIndex, lowerValue, upperValue) {})
                ],
              )
            ]),
          )
        ]),
      );

  Widget applyItem3(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 10.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: SHADOW,
        ),
        child: Column(children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  'Loan Amount',
                  style: getCustomFont(
                      size: 11.0,
                      color: Colors.black45,
                      weight: FontWeight.w600),
                ),
              ),
              Text(
                '\$50,000.00',
                style: getCustomFont(
                    size: 11.0, color: Colors.black87, weight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Loan Interest',
                  style: getCustomFont(
                      size: 11.0,
                      color: Colors.black45,
                      weight: FontWeight.w600),
                ),
              ),
              Text(
                '\$10,000.00',
                style: getCustomFont(
                    size: 11.0, color: Colors.black87, weight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  'Total Loan Repayment',
                  style: getCustomFont(
                      size: 11.0,
                      color: Colors.black45,
                      weight: FontWeight.w600),
                ),
              ),
              Text(
                '\$60,000.00',
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
