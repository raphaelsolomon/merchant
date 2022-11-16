import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookTest extends StatelessWidget {
  const BookTest({super.key});

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
                            Text('Order Track',
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
              Expanded(child: Column(children: [])),
              thirdScroll(context),
              Row(children: [
                Flexible(child: Container(
                  color: Colors.grey.shade200,
                  child: Row(children: [
                  Icon(Icons.call, color: Colors.black, size: 18.0),
                  const SizedBox(width: 8.0,),
                  Text('Call', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.w500),)
                ]),)),
                Flexible(child: Container(
                  color: BLUECOLOR,
                  child: Row(children: [
                  Icon(Icons.chat, color: Colors.white, size: 18.0),
                  const SizedBox(width: 8.0,),
                  Text('Chat', style: getCustomFont(size: 14.0, color: Colors.white, weight: FontWeight.w500),)
                ]),))
              ],)
            ])));
  }

  Widget thirdScroll(context) => GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1179324818/photo/hospital-building-with-glass-wall-and-mirrored-building.jpg?s=612x612&w=0&k=20&c=6QyyKqIhzhRzwuAKR2rNqIy4G1bETLObbIihtD_xRPk='), fit: BoxFit.cover),
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 10.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Well Life Store', style: getCustomFont(color: Colors.black, size:14.0, weight: FontWeight.w500),),
                 const SizedBox(height: 1.0,),
                Text('Delivery Partner', style: getCustomFont(color: Colors.black45, size:11.0, weight: FontWeight.normal),),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
