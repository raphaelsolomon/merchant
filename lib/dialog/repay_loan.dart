import 'package:flutter/material.dart';
import 'package:merchant/company/loan_confirmation.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';

class RepayLoan extends StatelessWidget {
  const RepayLoan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16.0),
          applyItem3(MediaQuery.of(context).size.width),
          const SizedBox(height: 20.0),
          getPayButton(context, (){
            showRequestSheet(context, LoanConfirmation());
          },  'Pay Now'),
          const SizedBox(height: 20.0),
        ],
      ),
    ));
  }

  Widget getPayButton(context, callBack, text) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
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

  Widget applyItem3(size) => Container(
        padding: const EdgeInsets.only(
            right: 20.0, top: 10.0, bottom: 10.0, left: 20.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
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
