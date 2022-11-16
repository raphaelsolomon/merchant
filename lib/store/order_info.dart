import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

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
                          Text('Order Information',
                              style: getCustomFont(
                                  size: 17.0, color: Colors.white)),
                          Icon(
                            null,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        'Order ID - DW14141',
                        style: getCustomFont(
                            size: 15.0,
                            color: Colors.black,
                            weight: FontWeight.w500),
                      )),
                      Text(
                        'IN TRANSIST',
                        style: getCustomFont(
                            size: 14.0,
                            color: Colors.amber,
                            weight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Text(
                            'Ordered On',
                            style: getCustomFont(
                                size: 10.0,
                                color: Colors.black45,
                                weight: FontWeight.normal),
                          ),
                          Text(
                            '13 June 2020',
                            style: getCustomFont(
                                size: 12.0,
                                color: Colors.black45,
                                weight: FontWeight.w400),
                          ),
                        ],
                      )),
                      Flexible(
                          child: Column(
                        children: [
                          Text(
                            'Amount',
                            style: getCustomFont(
                                size: 10.0,
                                color: Colors.black45,
                                weight: FontWeight.normal),
                          ),
                          Text(
                            '\$13.00',
                            style: getCustomFont(
                                size: 12.0,
                                color: Colors.black45,
                                weight: FontWeight.w400),
                          ),
                        ],
                      )),
                      Flexible(
                          child: Column(
                        children: [
                          Text(
                            'payment',
                            style: getCustomFont(
                                size: 10.0,
                                color: Colors.black45,
                                weight: FontWeight.normal),
                          ),
                          Text(
                            'COD',
                            style: getCustomFont(
                                size: 12.0,
                                color: Colors.black45,
                                weight: FontWeight.w400),
                          ),
                        ],
                      )),
                      Flexible(
                          child: Column(
                        children: [
                          Text(
                            'Items',
                            style: getCustomFont(
                                size: 10.0,
                                color: Colors.black45,
                                weight: FontWeight.normal),
                          ),
                          Text(
                            '3 Items',
                            style: getCustomFont(
                                size: 12.0,
                                color: Colors.black45,
                                weight: FontWeight.w400),
                          ),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.white,
                      child:
                          Icon(Icons.file_copy, color: BLUECOLOR, size: 25.0)),
                  CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.white,
                      child:
                          Icon(Icons.bus_alert, color: BLUECOLOR, size: 25.0)),
                  CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.grey.shade400,
                      child: Icon(Icons.home_sharp,
                          color: Colors.grey, size: 25.0))
                ],
              ),
            ),
            Expanded(child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Ordered Items', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.w500)),
                const SizedBox(height: 20.0),
                Expanded(child: Column(
                  children: List.generate(3, (i) => Column(children: [
                    Text('Vis VapoRub Balm', style: getCustomFont(size: 15.0, color: Colors.black87)),
                    const SizedBox(height: 2.0),
                    Row(
                      children: [
                        Flexible(child: Text('Pack of 500gm', style: getCustomFont(size: 10.0, color: Colors.black38))),
                         Text('\$6.00', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.w500))
                      ],
                    ),
                  ],)).toList()
                ),)
              ],)
            )),
            const SizedBox(
              height: 2.0,
            ),
            prescriptionUpload(context),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: () => Get.to(() => null),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45.0,
                color: BLUECOLOR,
                child: Text(
                  'Track Order',
                  style: getCustomFont(size: 14.0, color: Colors.white),
                ),
              ),
            )
          ])),
    );
  }

  Widget prescriptionUpload(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(children: [
        Image.asset('assets/imgs/logo.png', width: 30.0, height: 30.0, fit: BoxFit.contain),
        const SizedBox(width: 18.0,),
        Flexible(child: Text('prescription Uploaded', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.w500,))),
        Icon(Icons.remove_red_eye_sharp, color: BLUECOLOR, size: 18.0,),
      ]));
}
