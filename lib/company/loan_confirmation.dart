import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:merchant/dialog/payment_confirm_dialog.dart';
import 'package:merchant/dialog/subscribe.dart';

class LoanConfirmation extends StatefulWidget {
  const LoanConfirmation({Key? key}) : super(key: key);

  @override
  State<LoanConfirmation> createState() => _LoanConfirmationState();
}

class _LoanConfirmationState extends State<LoanConfirmation> {
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
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios,
                          size: 18.0, color: Colors.white)),
                  Flexible(
                    child: Text('Loan Payment Confirmation',
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
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Please confirm the correctness of the details below initiating payment!.',
                          textAlign: TextAlign.center,
                          style: getCustomFont(size: 14.0, color: Colors.black45),
                        ),
                      ),
                      const SizedBox(
                        height: 45.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Loan Class',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              'One-Off Pay',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Loan Type',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              'Cash Loan',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Loan Date',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              '${DateFormat('dd EEEE, MMM, yyyy').format(DateTime.now())}',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Loan Provider',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              'Rain Money',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Amount to pay (\$)',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              '\$100.00',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Transaction Fee',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              '\$5.00',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Coupon',
                                style: getCustomFont(
                                    size: 14.0,
                                    color: Colors.black45,
                                    weight: FontWeight.w600),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              '\$0.00',
                              style: getCustomFont(
                                  size: 15.5,
                                  color: Colors.black87,
                                  weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Total Amount',
                                style: getCustomFont(
                                    size: 16.0,
                                    color: BLUECOLOR,
                                    weight: FontWeight.bold),
                              ),
                            ),
                            Text(' - ',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black54)),
                            Text(
                              '\$105.00',
                              style: getCustomFont(
                                  size: 19.0,
                                  color: BLUECOLOR,
                                  weight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              getPayButton(context, () => showRequestSheet(context, LoanConfirmationDialog()), 'Continue'),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ))
        ]));
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
                    size: 15.0, color: Colors.white, weight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );
}
