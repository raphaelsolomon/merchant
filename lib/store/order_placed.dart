import 'package:merchant/constant/strings.dart';
import 'package:merchant/store/recent_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFf6f6f6),
            child: Column(
              children: [
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
                              Text('Order Placed',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0,),
                    Text(
                      'Your order has been placed successfully,\nand will be on the way soon.',
                      textAlign: TextAlign.center,
                      style: getCustomFont(size: 14.0, color: Colors.black54),
                    )
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Get.to(() => RecentOrder());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45.0,
                    color: BLUECOLOR,
                    child: Text(
                      'My Order',
                      style: getCustomFont(size: 14.0, color: Colors.white),
                    ),
                  ),
                )
              ],
            )));
  }
}
