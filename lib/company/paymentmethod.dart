import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

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
                  Text('Payment Methods',
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
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 11.0),
                    decoration: BoxDecoration(
                        color: BLUECOLOR,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Amount to pay ',
                            style:
                                getCustomFont(color: Colors.white, size: 13.0)),
                        Text('\$31.0 ',
                            style: getCustomFont(
                                color: Colors.white,
                                size: 15.0,
                                weight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    dashPattern: [8, 4],
                    strokeCap: StrokeCap.butt,
                    color: Colors.black,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 7.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Icon(Icons.wallet_giftcard,
                                    color: Colors.lightBlue),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text('Wallet ',
                                    style: getCustomFont(
                                        color: Colors.black,
                                        size: 16.0,
                                        weight: FontWeight.w700)),
                              ],
                            ),
                          ),
                          Text('\$314.50 ',
                              style: getCustomFont(
                                  color: Colors.black,
                                  size: 15.0,
                                  weight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Cards',
                    style: getCustomFont(
                        weight: FontWeight.bold,
                        size: 24.0,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  items(Icons.credit_card, 'Debit Card'),
                  Divider(),
                  items(FontAwesome5.credit_card, 'Credit Card'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Cash',
                    style: getCustomFont(
                        weight: FontWeight.bold,
                        size: 24.0,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  items(Icons.money, 'Cash on Delivery'),
                  Divider(),
                  items(FontAwesome5.cash_register, 'Pay cash on spot'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Bank',
                    style: getCustomFont(
                        weight: FontWeight.bold,
                        size: 24.0,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  items(Icons.money, 'USSD'),
                  Divider(),
                  items(FontAwesome5.cash_register, 'Cheque Payment'),
                  Divider(),
                  items(Icons.money, 'Bank Transfer'),
                  Divider(),
                  items(FontAwesome5.cash_register, 'Net Banking'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Others',
                    style: getCustomFont(
                        weight: FontWeight.bold,
                        size: 24.0,
                        color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  items(Icons.paypal, 'Paypal'),
                  Divider(),
                  items(FontAwesome5.amazon_pay, 'Paystack'),
                  Divider(),
                  items(FontAwesome5.amazon_pay, 'Razor Pay'),
                ],
              ),
            ),
          ))
        ]));
  }

  Widget items(icon, text) => Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(
            width: 15.0,
          ),
          Text('$text',
              style: getCustomFont(
                  color: Colors.black, size: 17.0, weight: FontWeight.w500)),
        ],
      );
}
