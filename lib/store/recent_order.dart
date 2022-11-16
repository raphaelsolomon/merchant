import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RecentOrder extends StatefulWidget {
  const RecentOrder({super.key});

  @override
  State<RecentOrder> createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {
  String past = 'Recent';

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
                              Text('${past} Order',
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
                Container(
                  width: 166.0,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.white,
                      boxShadow: SHADOW),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          past = 'Recent';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color:
                                past == 'Recent' ? BLUECOLOR : Colors.transparent,
                            boxShadow: past == 'Recent' ? SHADOW : null),
                        child: FittedBox(
                          child: Text(
                            'Recent',
                            style: getCustomFont(
                                size: 13.0,
                                color:
                                    past == 'Recent' ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          past = 'Past';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: past == 'Past'
                                ? BLUECOLOR
                                : Colors.transparent,
                            boxShadow: past == 'Past' ? SHADOW : null),
                        child: FittedBox(
                          child: Text(
                            'Past',
                            style: getCustomFont(
                                size: 13.0,
                                color: past == 'Past'
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
                    child: past == 'Recent'
                        ? ListView.builder(
                            padding: const EdgeInsets.all(0.0),
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => Container(
                                  color: Colors.white,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  padding: const EdgeInsets.all(12.0),
                                  child: thirdScroll(context),
                                ))
                        : ListView.builder(
                            padding: const EdgeInsets.all(0.0),
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (ctx, i) => Container(
                                  color: Colors.white,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  padding: const EdgeInsets.all(12.0),
                                  child: pastOrder(context),
                                )))
              ],
            )));
  }

  Widget thirdScroll(context) => GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/1.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                            child: Text(
                          'Well Life Store',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 14.0,
                              weight: FontWeight.w500),
                        )),
                      ),
                      Text(
                        'IN-TRANSIT',
                        style: getCustomFont(
                            color: Colors.amber,
                            size: 14.0,
                            weight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 0.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                            child: Text(
                          '13 june 11:20 am',
                          style: getCustomFont(
                              color: Colors.black45,
                              size: 12.0,
                              weight: FontWeight.w400),
                        )),
                      ),
                      Text(
                        '\$18.00 | Card',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 11.0,
                            weight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ...List.generate(
                    3,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FittedBox(
                                child: Text(
                              'Non Drosy lantin Tablet',
                              style: getCustomFont(
                                  color: Colors.black,
                                  size: 11.5,
                                  weight: FontWeight.w400),
                            )),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 14.0,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14.0,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget pastOrder(context) => GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('assets/imgs/1.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                            child: Text(
                          'Well Life Store',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 14.0,
                              weight: FontWeight.w500),
                        )),
                      ),
                      Text(
                        'DELIVERED',
                        style: getCustomFont(
                            color: Colors.lightGreen,
                            size: 14.0,
                            weight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 0.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                            child: Text(
                          '13 june 11:20 am',
                          style: getCustomFont(
                              color: Colors.black45,
                              size: 12.0,
                              weight: FontWeight.w400),
                        )),
                      ),
                      Text(
                        '\$18.00 | Card',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 11.0,
                            weight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ...List.generate(
                    3,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FittedBox(
                                child: Text(
                              'Non Drosy lantin Tablet',
                              style: getCustomFont(
                                  color: Colors.black,
                                  size: 11.5,
                                  weight: FontWeight.w400),
                            )),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 14.0,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14.0,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
