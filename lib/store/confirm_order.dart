import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFf6f6f6),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: BLUECOLOR,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 19.0,
                                )),
                            Text('Items in cart',
                                style: getCustomFont(
                                    size: 17.0, color: Colors.white)),
                            Icon(
                              null,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          color: BLUECOLOR,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home',
                              style: getCustomFont(
                                  size: 15.0,
                                  color: Colors.black45,
                                  weight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              DUMMYTEXT,
                              style: getCustomFont(
                                  size: 13.0,
                                  color: Colors.black,
                                  weight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: List.generate(6, (index) => cartItems()),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(15.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pescription Uploaded',
                              style: getCustomFont(
                                  size: 15.0,
                                  color: Colors.black,
                                  weight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.remove_red_eye_sharp,
                              color: BLUECOLOR,
                              size: 19.0,
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          getTotal('Sub Total', '18.00'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          getTotal('Promo Code Applied', '2.00'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          getTotal('Service Charge', '4.00'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          getTotal('Amount to pay', '20.00', bold: true),
                        ],
                      )),
                ],
              )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45.0,
                color: BLUECOLOR,
                child: Text(
                  'Continue to pay',
                  style: getCustomFont(size: 14.0, color: Colors.white),
                ),
              )
            ])));
  }

  Widget getTotal(text, price, {bold = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            '${text}',
            style: getCustomFont(
                size: 14.0,
                color: bold ? Colors.black : Colors.black45,
                weight: FontWeight.w400),
          )),
          Text(
            '\$${price}',
            style: getCustomFont(
                size: 14.0,
                color: bold ? Colors.black : Colors.black45,
                weight: bold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      );

  Widget cartItems() => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Solospir 100mg Tablet',
                  style: getCustomFont(
                      size: 14.0,
                      color: Colors.black45,
                      weight: FontWeight.w500),
                )),
                Text(
                  '\$4.0',
                  style: getCustomFont(
                      size: 14.0, color: Colors.black, weight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              '2 packs',
              style: getCustomFont(
                  size: 14.0, color: Colors.black45, weight: FontWeight.w500),
            )
          ],
        ),
      );
}
