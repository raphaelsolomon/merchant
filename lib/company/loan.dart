import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetLoan extends StatefulWidget {
  const GetLoan({Key? key}) : super(key: key);

  @override
  State<GetLoan> createState() => _GetLoanState();
}

class _GetLoanState extends State<GetLoan> {
  String past = 'Apply';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text('Get Loan',
                        style: getCustomFont(size: 16.0, color: Colors.white)),
                  ),
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
          const SizedBox(
            height: 15.0,
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: SHADOW),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    past = 'My Loan';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: past == 'My Loan' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'My Loan' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'My Loan',
                      style: getCustomFont(
                          size: 13.0,
                          color:
                              past == 'My Loan' ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    past = 'Apply';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: past == 'Apply' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'Apply' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'Apply',
                      style: getCustomFont(
                          size: 13.0,
                          color: past == 'Apply' ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    past = 'Repay Loan';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color:
                          past == 'Repay Loan' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'Repay Loan' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'Repay Loan',
                      style: getCustomFont(
                          size: 13.0,
                          color: past == 'Repay Loan'
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
              child: Column(children: [
            const SizedBox(
              height: 20.0,
            ),
            ...List.generate(3, (index) => loanItem(size))
          ]))
        ]));
  }

  Widget loanItem(size) => Container(
        padding: const EdgeInsets.only(right: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: SHADOW,
        ),
        child: Row(children: [
          Container(
            width: 10.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0))),
          ),
          const SizedBox(width: 10.0),
          Flexible(
            child: Column(children: [
              SizedBox(
                  width: size.width,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Approve',
                        style: getCustomFont(
                          size: 11.0,
                          color: Colors.greenAccent,
                        ),
                      ))),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                '\$51,000.00',
                style: getCustomFont(
                    size: 17.0, color: Colors.black87, weight: FontWeight.w600),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                'To be payed back in 15 days, with an interest of \$10,000.00',
                style: getCustomFont(
                    size: 12.0, color: Colors.black54, weight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Application Date: 28th July 2020',
                      style: getCustomFont(
                          size: 11.0,
                          color: Colors.black45,
                          weight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Text(
                      'Due Date: 28th December 2020',
                      style: getCustomFont(
                          size: 11.0,
                          color: Colors.black45,
                          weight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            ]),
          )
        ]),
      );

  Widget applyItem(size) => Container(
        padding: const EdgeInsets.only(right: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: SHADOW,
        ),
        child: Row(children: [
          Container(
            width: 10.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0))),
          ),
          const SizedBox(width: 10.0),
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
}
