import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:merchant/constant/strings.dart';

class ExtendLoan extends StatefulWidget {
  const ExtendLoan({Key? key}) : super(key: key);

  @override
  State<ExtendLoan> createState() => _ExtendLoanState();
}

class _ExtendLoanState extends State<ExtendLoan> {
  String value = 'true';
  String interval = '3';
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          applyItem(MediaQuery.of(context).size.width),
          const SizedBox(height: 5.0),
          applyItem3(MediaQuery.of(context).size.width),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Checkbox(
                    value: value == 'true',
                    activeColor: BLUECOLOR,
                    onChanged: (b) {
                      if (value == 'true') {
                        value = 'false';
                      } else {
                        value = 'true';
                      }
                      setState((){});
                    }), Text('Apply to Others', style: getCustomFont(size: 12.0, color: Colors.black54)),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: getPayButton(context, () {}, 'Submit Extension'),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    ));
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
            'Extend Loan Interval',
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
            height: 5.0,
          ),
          Row(
            children: [
              Flexible(
                child:FlutterSlider(
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
            '\$51,000.00',
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
                    values: [3],
                    max: 30,
                    min: 3,
                    onDragging: (handlerIndex, lowerValue, upperValue) {}),
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
                '\$50,000.00',
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
                '\$10,000.00',
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
