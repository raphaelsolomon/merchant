import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HospitalDetails extends StatefulWidget {
  const HospitalDetails({super.key});

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  int counter = 0;

  List<String> tabs = ['Overviews', 'Locations', 'Reviews', 'Business Hours'];
  String selectedTab = 'Overviews';
  int totalFacility = 6;
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      resizeToAvoidBottomInset: true,
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: 250.0,
              child: Stack(
                children: [
                  PageView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) => setState(() {
                            counter = value;
                          }),
                      itemBuilder: ((context, index) => Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/imgs/3.png'),
                                    fit: BoxFit.cover)),
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 43.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 19.0,
                              color: Colors.white,
                            )),
                        GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.bookmark_outline,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ...List.generate(
                              3, (index) => dotIndicator(counter, index))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apple Hospital',
                    style: getCustomFont(
                        size: 19.0,
                        color: Colors.black,
                        weight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  Text(
                    'General Hospital',
                    style: getCustomFont(
                        size: 14.0,
                        color: Colors.black45,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...tabs.map(
                          (e) => GestureDetector(
                            onTap: () => setState(() {
                              selectedTab = e;
                            }),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text(
                                '$e',
                                style: getCustomFont(
                                    size: 15.0,
                                    color: selectedTab == e
                                        ? BLUECOLOR
                                        : Colors.black,
                                    weight: selectedTab == e
                                        ? FontWeight.w600
                                        : FontWeight.normal),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
                child: selectedTab == 'Overviews'
                    ? getOverview()
                    : selectedTab == 'Locations'
                        ? SingleChildScrollView(
                            child: Column(
                                children: List.generate(
                                    2, (index) => locationItem())),
                          )
                        : selectedTab == 'Reviews'
                            ? SingleChildScrollView(
                                child: Column(
                                    children: List.generate(
                                        4, (index) => getReviews())),
                              )
                            : hours()),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: width,
                    height: 50.0,
                    color: BLUECOLOR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 19.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Call Now',
                          style: getCustomFont(size: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 1.0,
                ),
                Flexible(
                  child: Container(
                    width: width,
                    height: 50.0,
                    color: BLUECOLOR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 19.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Chat Now',
                          style: getCustomFont(size: 13.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getOverview() => Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'About Us',
            style: getCustomFont(
                color: Colors.black, size: 16.0, weight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '$DUMMYTEXT',
            style: getCustomFont(
                color: Colors.black54, size: 13.5, weight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            'Awards',
            style: getCustomFont(
                color: Colors.black, size: 16.0, weight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ...List.generate(3, (index) => awardItem())
        ]),
      ));

  Widget awardItem() => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0, left: ),
            //   child: VerticalDivider(
            //     color: Colors.black,
            //     thickness: 2,
            //   ),
            // ),
            Container(
              width: 15.0,
              child: Stack(
                children: [
                  const SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: BLUECOLOR.withOpacity(.2),
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(width: 2.0, color: BLUECOLOR)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: VerticalDivider(
                      color: Colors.black45,
                      thickness: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 25.0,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'July 2019',
                  style: getCustomFont(size: 16.0, color: BLUECOLOR),
                ),
                const SizedBox(
                  height: 1.0,
                ),
                Text(
                  'Humanitarian Award',
                  style: getCustomFont(
                      color: Colors.black, size: 16.0, weight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  '$DUMMYTEXT',
                  style: getCustomFont(
                      color: Colors.black54,
                      size: 13.5,
                      weight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 18.0,
                )
              ],
            ))
          ],
        ),
      );

  Widget getReviews() => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(bottom: 7.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: SHADOW,
        ),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Richard Wilson',
                        style: getCustomFont(
                          size: 17.0,
                          color: Colors.black,
                          weight: FontWeight.w500,
                        )),
                    Text('Reviewed 2 days ago',
                        style: getCustomFont(
                          size: 13.0,
                          color: Colors.black54,
                          weight: FontWeight.normal,
                        )),
                    const SizedBox(
                      height: 3.0,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15.0,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(height: 7.0),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          color: Color(0xFF00CC80),
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: Text('I recommend the doctor',
                              style: getCustomFont(
                                size: 13.0,
                                color: Color(0xFF00CC80),
                                weight: FontWeight.normal,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7.0),
                    Text('$DUMMYREVIEW',
                        style: getCustomFont(
                          size: 13.0,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                    const SizedBox(height: 10.0),
                    DottedBorder(
                        color: Colors.black45,
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                        )),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: Colors.lightBlueAccent,
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: Text('Reply',
                              style: getCustomFont(
                                size: 13.0,
                                color: Colors.lightBlueAccent,
                                weight: FontWeight.normal,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text('Recommend?',
                            style: getCustomFont(
                              size: 13.0,
                              color: Colors.black,
                              weight: FontWeight.normal,
                            )),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.0, color: Colors.black45),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up_outlined,
                                color: Colors.black,
                                size: 16.0,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text('Yes',
                                  style: getCustomFont(
                                    size: 13.0,
                                    color: Colors.black,
                                    weight: FontWeight.normal,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1.0, color: Colors.black45),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_down_outlined,
                                color: Colors.black,
                                size: 16.0,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text('No',
                                  style: getCustomFont(
                                    size: 13.0,
                                    color: Colors.black,
                                    weight: FontWeight.normal,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      );

  Widget locationItem() => Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Smile Cute Dental Care Center',
            maxLines: 1,
            style: getCustomFont(
                color: Colors.black, size: 17.0, weight: FontWeight.w500),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15.0,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                '(16592)',
                style: getCustomFont(
                    color: Colors.black, size: 13.0, weight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 3.0,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.black,
                size: 13.0,
              ),
              Flexible(
                child: Text(
                  '2286 Sundown Lane, Austin, Texas 78749, USA',
                  style: getCustomFont(
                      color: Colors.black, size: 13.0, weight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'Get Directions',
              style: getCustomFont(
                  color: BLUECOLOR, size: 14.0, weight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    4,
                    (index) => Container(
                          width: 40.0,
                          height: 40.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/imgs/1.png')),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey),
                        ))
              ],
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Divider(),
          Text(
            'Mon - Sat',
            style: getCustomFont(
                color: Colors.black, size: 13.0, weight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1.0, color: Colors.black),
                        color: Colors.white),
                    child: FittedBox(
                      child: Text(
                        '10:00 AM - 2:00 PM',
                        maxLines: 1,
                        style: getCustomFont(
                          color: Colors.black,
                          size: 12.0,
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 9.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1.0, color: Colors.black),
                        color: Colors.white),
                    child: FittedBox(
                      child: Text(
                        '4:00 AM - 9:00 PM',
                        maxLines: 1,
                        style: getCustomFont(
                          color: Colors.black,
                          size: 12.0,
                        ),
                      ),
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Sun',
            style: getCustomFont(
                color: Colors.black, size: 13.0, weight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 1.0, color: Colors.black),
                  color: Colors.white),
              child: FittedBox(
                child: Text(
                  '10:00 AM - 2:00 PM',
                  maxLines: 1,
                  style: getCustomFont(
                    color: Colors.black,
                    size: 12.0,
                  ),
                ),
              ))
        ],
      ));

  Widget hours() => Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: SHADOW),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: getCustomFont(size: 15.0, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '5 Nov 2019',
                        style: getCustomFont(size: 13.0, color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.green.shade100,
                          ),
                          child: Text(
                            'Open Now',
                            style:
                                getCustomFont(size: 13.0, color: Colors.green),
                          )),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '07:00 AM - 09:00 PM',
                        style: getCustomFont(size: 12.0, color: Colors.black54),
                      ),
                    ],
                  )
                ]),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: SHADOW),
            child: Column(children: [
              ...List.generate(
                  7,
                  (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.black,
                                size: 16.0,
                              ),
                              const SizedBox(
                                width: 3.0,
                              ),
                              Text(
                                'Monday',
                                style: getCustomFont(
                                    size: 13.5, color: Colors.black),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '07:00 AM - 09:00 PM',
                                style: getCustomFont(
                                    size: 13.0, color: Colors.black45),
                              ),
                            ),
                          )
                        ],
                      ))
            ]),
          )
        ],
      );

  Widget dotIndicator(total, i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: total == i ? BLUECOLOR : BLUECOLOR.withOpacity(.3),
          radius: 3.5,
        ),
        const SizedBox(
          width: 5.0,
        ),
      ],
    );
  }
}
