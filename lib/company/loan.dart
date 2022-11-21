import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/apply_loan.dart';
import 'package:merchant/dialog/extend_loan.dart';
import 'package:merchant/dialog/repay_loan.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetLoan extends StatefulWidget {
  const GetLoan({Key? key}) : super(key: key);

  @override
  State<GetLoan> createState() => _GetLoanState();
}

class _GetLoanState extends State<GetLoan> {
  String past = 'My Loan';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
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
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: SHADOW),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Flexible(
                child: GestureDetector(
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
                        color:
                            past == 'My Loan' ? BLUECOLOR : Colors.transparent,
                        boxShadow: past == 'My Loan' ? SHADOW : null),
                    child: FittedBox(
                      child: Text(
                        'Loans',
                        style: getCustomFont(
                            size: 13.0,
                            color: past == 'My Loan'
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
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
                            color:
                                past == 'Apply' ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
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
                        color: past == 'Repay Loan'
                            ? BLUECOLOR
                            : Colors.transparent,
                        boxShadow: past == 'Repay Loan' ? SHADOW : null),
                    child: FittedBox(
                      child: Text(
                        'Repay',
                        style: getCustomFont(
                            size: 13.0,
                            color: past == 'Repay Loan'
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      past = 'Extend Loan';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: past == 'Extend Loan'
                            ? BLUECOLOR
                            : Colors.transparent,
                        boxShadow: past == 'Extend Loan' ? SHADOW : null),
                    child: FittedBox(
                      child: Text(
                        'Extend',
                        style: getCustomFont(
                            size: 13.0,
                            color: past == 'Extend Loan'
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          past == 'Repay Loan'
              ? RepayLoan()
              : past == 'Apply'
                  ? Applyloan()
                  : past == 'Extend Loan'
                      ? ExtendLoan()
                      : Expanded(
                          child: SingleChildScrollView(
                          child: Column(children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            ...List.generate(3, (index) => loanItem(size))
                          ]),
                        ))
        ]));
  }

  Widget loanItem(size) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: SHADOW,
        ),
        child: IntrinsicHeight(
          child: Row(children: [
            Container(
              width: 10.0,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0))),
            ),
            const SizedBox(width: 10.0),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, top: 10.0, bottom: 10.0, left: 10.0),
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
                                weight: FontWeight.w500),
                          ))),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    '\$51,000.00',
                    style: getCustomFont(
                        size: 19.0,
                        color: Colors.black87,
                        weight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    'To be payed back in 15 days, with an interest of \$10,000.00',
                    style: getCustomFont(
                        size: 12.0,
                        color: Colors.black54,
                        weight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Application Date: 28th July 2020',
                          style: getCustomFont(
                              size: 11.0,
                              color: Colors.black45,
                              weight: FontWeight.normal),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Due Date: 28th December 2020',
                            style: getCustomFont(
                                size: 11.0,
                                color: Colors.black45,
                                weight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            )
          ]),
        ),
      );
}
