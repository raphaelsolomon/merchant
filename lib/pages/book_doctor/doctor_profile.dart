import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  List<String> headers = [
    'Overview',
    'Location',
    'Reviews',
    'Hours',
  ];

  String index = 'Overview';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFf6f6f6),
      child: Column(
        children: [
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
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18.0,
                      )),
                  Text('Doctor Profile',
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
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [...headers.map((e) => _dashList(e)).toList()],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  index == 'Location'
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(children: [locationItem()]),
                          ),
                        )
                      : index == 'Hours'
                          ? Expanded(
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  hours(),
                                ]),
                              ),
                            )
                          : index == 'Reviews'
                              ? Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                        children: List.generate(
                                            4, (index) => getReviews())),
                                  ),
                                )
                              : Expanded(child: patientProfile())
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: getButton(context, () {
               context.read<HomeController>().setPage(-1);
            }, text: 'Book Appointment'),
          ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  Widget _dashList(e) => GestureDetector(
        onTap: () => setState(() => index = e),
        child: Container(
            margin: const EdgeInsets.only(right: 3.0),
            padding:const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: index == e ? BLUECOLOR : Colors.transparent,
                borderRadius: BorderRadius.circular(50.0)),
            child: Text(
              '$e',
              style: getCustomFont(
                  size: 15.0,
                  color: index == e ? Colors.white : Colors.black,
                  weight: FontWeight.normal),
            )),
      );
//================LOCATION=======================================
  Widget locationItem() {
    return Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
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
            FittedBox(
              child: Text(
                'MDS - Periodontology and Oral Implantology',
                style: getCustomFont(
                    color: Colors.black54, size: 13.0, weight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 5.0,
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
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400),
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            4,
                            (index) => Container(
                                  width: 40.0,
                                  height: 40.0,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/imgs/1.png')),
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.grey),
                                ))
                      ],
                    ),
                  ),
                ),
                PhysicalModel(
                  elevation: 10.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                  shadowColor: Colors.grey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 20.0),
                      child: FittedBox(
                        child: Text(
                          '\$250',
                          maxLines: 1,
                          style: getCustomFont(size: 12.0, color: Colors.black),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 7.0,
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
                        color: Colors.black,
                        size: 13.0,
                        weight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Get Directions',
              style: getCustomFont(
                  color: BLUECOLOR, size: 14.0, weight: FontWeight.w400),
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
                          '10:00 AM - 2:00 PM',
                          maxLines: 1,
                          style: getCustomFont(
                            color: Colors.black,
                            size: 12.0,
                          ),
                        ),
                      )),
                )
              ],
            )
          ],
        ));
  }

  Widget getButton(context, callBack,
          {color = BLUECOLOR, text = 'Search Now'}) =>
      GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11.0),
            child: Center(
              child: Text(
                text,
                maxLines: 1,
                style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );
//====================HOURS===============================================
  Widget hours() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: SHADOW),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              'assets/imgs/today.png',
              width: 50,
              height: 50,
            ),
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
                      style: getCustomFont(size: 13.0, color: Colors.green),
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: SHADOW),
          child: Column(children: [
            ...List.generate(7, (index) => Row(
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
                      style: getCustomFont(size: 13.5, color: Colors.black),
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
                      style: getCustomFont(size: 13.0, color: Colors.black45),
                    ),
                  ),
                )
              ],
            ))
          ]),
        )
      ],
    );
  }

//============================OVERVIEW=====================================
  Widget patientProfile() => SingleChildScrollView(
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35.0,
                    child: Stack(children: [
                      Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: PhysicalModel(
                        elevation: 10.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Icon(
                            FontAwesome5.info,
                            size: 15.0,
                            color: Color(0xFF838383),
                          ),
                        ),
                      ),
                    ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: VerticalDivider(
                            color: Colors.black45,
                            thickness: 2,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: SHADOW),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage('assets/imgs/1.png'),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dr. Darren Elder',
                                        style: getCustomFont(
                                            color: Colors.black,
                                            size: 22.0,
                                            weight: FontWeight.w400),
                                      ),
                                      Row(
                                        children: [
                                          PhysicalModel(
                                            elevation: 10.0,
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            shadowColor: Colors.grey,
                                            child: SizedBox(
                                              width: 25.0,
                                              height: 25.0,
                                              child: Icon(
                                                FontAwesome5.teeth,
                                                size: 11.0,
                                                color: Color(0xFF838383),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            'Dentist',
                                            style: getCustomFont(
                                                color: Colors.black54,
                                                size: 12.5,
                                                weight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            FittedBox(
                              child: Text(
                                'BDS, MDS - Oral & Maxillofacial Surgery',
                                maxLines: 1,
                                style: getCustomFont(
                                    color: Colors.black54,
                                    size: 12.4,
                                    weight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '15+ Exp',
                                  style: getCustomFont(
                                      color: Colors.red,
                                      size: 12.0,
                                      weight: FontWeight.w400),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        size: 15.0, color: Colors.black),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Florida, USA',
                                      style: getCustomFont(
                                          color: Colors.black54,
                                          size: 12.0,
                                          weight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 0.0,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                  width: 35.0,
                  child: Stack(children: [
                    Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: PhysicalModel(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Icon(
                          FontAwesome5.user,
                          size: 15.0,
                          color: Color(0xFF838383),
                        ),
                      ),
                    ),
                  ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: VerticalDivider(
                          color: Colors.black45,
                          thickness: 2,
                        ),
                      ),
                    ),
                  ]),
                ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: SHADOW),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Us',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 16.0,
                                    weight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$DUMMYTEXT',
                                style: getCustomFont(
                                    color: Colors.black54,
                                    size: 13.0,
                                    weight: FontWeight.w400),
                              ),
                            ])),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 0.0,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                  width: 35.0,
                  child: Stack(children: [
                    Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: PhysicalModel(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Icon(
                          FontAwesome5.medkit,
                          size: 15.0,
                          color: Color(0xFF838383),
                        ),
                      ),
                    ),
                  ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: VerticalDivider(
                          color: Colors.black45,
                          thickness: 2,
                        ),
                      ),
                    ),
                  ]),
                ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: SHADOW),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Education',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 17.0,
                                    weight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ...List.generate(1, (index) => EducationItem())
                            ])),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 0.0,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                  width: 35.0,
                  child: Stack(children: [
                    Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: PhysicalModel(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Icon(
                          FontAwesome5.school,
                          size: 15.0,
                          color: Color(0xFF838383),
                        ),
                      ),
                    ),
                  ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: VerticalDivider(
                          color: Colors.black45,
                          thickness: 2,
                        ),
                      ),
                    ),
                  ]),
                ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: SHADOW),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Work & Experience',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 19.0,
                                    weight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ...List.generate(2, (index) => workExperience())
                            ])),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 0.0,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 35.0,
                      child: Stack(children: [
                        Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: PhysicalModel(
                          elevation: 10.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          shadowColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Icon(
                              FontAwesome5.servicestack,
                              size: 15.0,
                              color: Color(0xFF838383),
                            ),
                          ),
                        ),
                      ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: VerticalDivider(
                              color: Colors.black45,
                              thickness: 2,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: SHADOW),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Services',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 19.0,
                                    weight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ...List.generate(2, (index) => serviceItem())
                            ])),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 35.0,
                    child: Stack(children: [
                      Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: PhysicalModel(
                        elevation: 10.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Icon(
                            FontAwesome5.tools,
                            size: 15.0,
                            color: Color(0xFF838383),
                          ),
                        ),
                      ),
                    ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: VerticalDivider(
                            color: Colors.transparent,
                            thickness: 2,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                    child: Container(
                        padding: const EdgeInsets.all(15.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 5.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: SHADOW),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Specialization',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 19.0,
                                    weight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              ...List.generate(2, (index) => specializationItem())
                            ])),
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget EducationItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check, size: 14.0, color: Colors.black),
              const SizedBox(
                width: 3.0,
              ),
              Flexible(
                child: Text(
                  'American Dental Medical University',
                  style: getCustomFont(
                      color: Colors.black, size: 14.0, weight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            'BDS',
            style: getCustomFont(
                color: Colors.black54, size: 13.0, weight: FontWeight.w400),
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            '1998 - 2003',
            style: getCustomFont(
                color: Colors.black54, size: 13.0, weight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget workExperience() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check, size: 14.0, color: Colors.black),
              const SizedBox(
                width: 3.0,
              ),
              Flexible(
                child: Text(
                  'Glowing Smiles Family Dental Clinic',
                  style: getCustomFont(
                      color: Colors.black, size: 15.0, weight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 1.0,
          ),
          Text(
            '2010 - Present (5 years)',
            style: getCustomFont(
                color: Colors.black54, size: 15.0, weight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );

  Widget serviceItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check, size: 14.0, color: Colors.black),
              const SizedBox(
                width: 3.0,
              ),
              Text(
                'Tooth cleaning',
                style: getCustomFont(
                    color: Colors.black, size: 13.0, weight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      );

  Widget specializationItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check, size: 14.0, color: Colors.black),
              const SizedBox(
                width: 3.0,
              ),
              Text(
                'Dental Care',
                style: getCustomFont(
                    color: Colors.black, size: 13.0, weight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      );

  Widget getReviews() => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(bottom: 7.0),
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
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(100.0),
                          padding: EdgeInsets.all(6),
                          dashPattern: [8, 4],
                          strokeCap: StrokeCap.butt,
                          color: Colors.black,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
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
                        ),
                        const SizedBox(width: 10.0),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(100.0),
                          padding: EdgeInsets.all(6),
                          dashPattern: [8, 4],
                          strokeCap: StrokeCap.butt,
                          color: Colors.black,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
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
}
