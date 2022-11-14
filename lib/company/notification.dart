import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
           Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 0.0),
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
                      onTap: () =>
                          context.read<HomeController>().onBackPress(),
                      child: Icon(Icons.arrow_back_ios,
                          size: 18.0, color: Colors.white)),
              
                  Text('Notification',
                      style:
                          getCustomFont(size: 16.0, color: Colors.white)),
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
            height: 10.0,
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        itemCount: 10,
                        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: SHADOW,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                                  decoration: BoxDecoration(
                                      color: BLUECOLOR,
                                      borderRadius: BorderRadius.circular(5.0)),
                                      child: Text('Order Received!!!', style: getCustomFont(size: 13.0, color: Colors.white),),
                                ),
                                const SizedBox(height: 8.0,),
                                Text('csccode tech, Your Order #2 has been received!!!.', style: getCustomFont(size: 13.0, color: Colors.black),),
                                const SizedBox(height: 3.0,),
                                 SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('29-Sept-2022 4:43 PM', style: getCustomFont(size: 13.0, color: Colors.black54),))),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 80.0,),
                  ],
                ),
              ))
        ]));
  }
}
