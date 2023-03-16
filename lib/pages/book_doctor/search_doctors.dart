import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/filterPage.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/pages/book_doctor/doctor_profile.dart';
import 'package:merchant/pages/book_doctor/time_and_date.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({Key? key}) : super(key: key);

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  List<String> catergories = ['Specialization', 'Services', 'Treatment', 'Hospital/Clinic', 'Diagnosis Test', 'Surgery/transplant'];

  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: BLUECOLOR,
            child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(onTap: () => context.read<HomeController>().onBackPress(), child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18.0)),
                    Flexible(
                      child: Text('Search by Doctor', style: getCustomFont(size: 18.0, color: Colors.white)),
                    ),
                    Icon(
                      null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              // getRegisterForm(
              //     ctl: null,
              //     hint: 'Search for categories',
              //     icon: Icons.search,
              //     height: 49.0),
              // const SizedBox(
              //   height: 13.0,
              // ),
              Container(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              catergories.length,
                              (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = '${catergories[index]}';
                                    });
                                    showRequestSheet(context, FilterPage('${catergories[index]}'));
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.0),
                                      margin: const EdgeInsets.only(right: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          border: Border.all(width: 1.0, color: selected == catergories[index] ? Colors.white : Colors.black45),
                                          color: selected == catergories[index] ? BLUECOLOR : Colors.white),
                                      child: Text(
                                        catergories[index],
                                        maxLines: 1,
                                        style: getCustomFont(
                                          color: selected == catergories[index] ? Colors.white : Colors.black,
                                          size: 12.0,
                                        ),
                                      ))))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text('16525 matches found for :',
                        style: getCustomFont(
                          size: 12.5,
                          color: Colors.black45,
                        )),
                    Text('Dental specialist In Bangalore',
                        style: getCustomFont(
                          size: 17.0,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
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
                ...List.generate(10, (index) => findDoctors()),
                const SizedBox(
                  height: 75.0,
                ),
              ],
            ),
          )),
        ]));
  }

  Widget findDoctors() => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1.0, blurRadius: 10.0, offset: Offset(0.0, 1.0))], color: Colors.white, borderRadius: BorderRadius.circular(13.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      'assets/imgs/2.png',
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 13.0,
                ),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ruby Perrln',
                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'MDS - periodontology, BDS',
                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              PhysicalModel(
                                elevation: 10.0,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100.0),
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
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Dentist',
                                style: GoogleFonts.poppins(color: Colors.lightBlue, fontSize: 13.0, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '9+ Exp',
                          style: GoogleFonts.poppins(color: Colors.redAccent, fontSize: 14.0, fontWeight: FontWeight.w400),
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
                          child: Row(
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
                                '(47)',
                                style: GoogleFonts.poppins(color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 14.0,
                            ),
                            Text(
                              'Florida, USA',
                              style: GoogleFonts.poppins(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
                Icon(
                  Icons.bookmark_outline,
                  size: 18.0,
                  color: BLUECOLOR,
                )
              ],
            ),
            const SizedBox(
              height: 2.0,
            ),
            Divider(),
            const SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      PhysicalModel(
                        elevation: 10.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0),
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                          child: Icon(
                            Icons.thumb_up,
                            size: 12.0,
                            color: Color(0xFF838383),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        '98%',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    PhysicalModel(
                      elevation: 10.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                        child: Icon(
                          Icons.money,
                          size: 12.0,
                          color: Color(0xFF838383),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      '\$300 - \$1000',
                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Flexible(
                  child: getProfileButton(context, () {
                    showRequestSheet(context, DoctorProfile());
                  }),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Flexible(
                  child: getButton(context, () {
                    showRequestSheet(context, TimeAndDate());
                  }, text: 'Book Appointment'),
                )
              ],
            )
          ],
        ),
      );

  Widget getProfileButton(context, callBack, {text = 'View Profile'}) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 1.0, color: BLUECOLOR), borderRadius: BorderRadius.circular(7.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(fontSize: 15.0, color: BLUECOLOR, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );

  Widget getButton(context, callBack, {color = BLUECOLOR, text = 'Search Now'}) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(7.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 11.0),
            child: Center(
              child: FittedBox(
                child: Text(
                  text,
                  maxLines: 1,
                  style: GoogleFonts.poppins(fontSize: 13.0, color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ),
      );
}
