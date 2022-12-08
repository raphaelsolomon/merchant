import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/dialog/webpages.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/store/categories_and_sub.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merchant/store/hospital_details.dart';
import 'package:merchant/store/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:merchant/store/search_pharmacy.dart';

Widget getDashboard(context, width) => Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 28.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/imgs/logo.png',
                    width: 150.0, fit: BoxFit.contain),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MyCart());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      FontAwesome5.cart_plus,
                      size: 19.0,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Hello, John Doe',
              style: getCustomFont(
                  size: 14.0, color: Colors.black45, weight: FontWeight.w500),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(
              'Find your medicines',
              style: getCustomFont(
                  size: 19.0, color: Colors.black, weight: FontWeight.w500),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: getCardForm('Search For Pharmacy Store'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Shop by categories',
                              style: getCustomFont(
                                  size: 14.0, color: Colors.black45),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => CategoriesAndSub()),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                'view all',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.greenAccent),
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...shop_by_categgory.map((e) => firstScroll(e))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Offers',
                              style: getCustomFont(
                                  size: 14.0, color: Colors.black45),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              'My Offer',
                              style: getCustomFont(
                                  size: 14.0, color: Colors.greenAccent),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...shop_by_offer.map((e) => secondScroll(context, e))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Deals',
                              style: getCustomFont(
                                  size: 14.0, color: Colors.black45),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: GestureDetector(
                              onTap: () => showRequestSheet(context, OtherWebPages('Deals and Offers')),
                              child: Text(
                                'view all',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.greenAccent),
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...shop_by_offer.map((e) => secondScroll(context, e))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () => Get.to(() => SearchStores((){}, 'Pharmacy Stores')),
                              child: Text(
                                'All Pharmacy stores',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.black45),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                 onTap: () => Get.to(() => SearchStores((){}, 'Hospitals/Clinics')),
                                child: Text(
                                  'All Hospital/Clinics',
                                  style: getCustomFont(
                                      size: 14.0, color: Colors.black45),
                                ),
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 15.0,
                    ),
                    GridView.builder(
                        padding: const EdgeInsets.only(right: 20.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: returnCrossAxis(width),
                            mainAxisSpacing: 15.0,
                            mainAxisExtent: 50.0,
                            crossAxisSpacing: 20.0),
                        itemCount: allStores.length,
                        itemBuilder: (ctx, i) =>
                            thirdScroll(context, allStores[i])),
                    const SizedBox(
                      height: 85.0,
                    ),
                  ],
                ),
              ),
            )
          ]),
    );

Widget getHospital(context, Function brand, {onBack}) => Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => onBack(),
                          child: Icon(Icons.arrow_back_ios,
                              size: 19.0, color: Colors.black)),
                      const SizedBox(width: 10.0),
                      Image.asset('assets/imgs/logo.png',
                          width: 150.0, fit: BoxFit.contain),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      null,
                      size: 19.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Hello, John Doe',
                style: getCustomFont(
                    size: 14.0, color: Colors.black45, weight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Find Hospital Near You',
                style: getCustomFont(
                    size: 19.0, color: Colors.black, weight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: getCardForm('Search For Hospitals'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Shop by categories',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.black45),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => brand(),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  'view all',
                                  style: getCustomFont(
                                      size: 14.0, color: BLUECOLOR),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            ...shop_by_categgory.map((e) => firstScroll(e))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Hospitals near you',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.black45),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                'view all',
                                style:
                                    getCustomFont(size: 14.0, color: BLUECOLOR),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListView.builder(
                        padding: const EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (ctx, i) =>
                            hospitalItem(context, 'Hospital')),
                    const SizedBox(
                      height: 85.0,
                    ),
                  ],
                ),
              ),
            )
          ]),
    );

Widget hospitalItem(context, type) => GestureDetector(
      onTap: () {
        Get.to(() => HospitalDetails());
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Apple ${type}',
                          style: getCustomFont(
                              size: 15.0,
                              color: Colors.black,
                              weight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          'General ${type}',
                          style: getCustomFont(
                              size: 12.0,
                              color: Colors.black45,
                              weight: FontWeight.w400),
                        )
                      ],
                    )),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                            3,
                            (i) => Container(
                                  height: 40.0,
                                  width: 80.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/imgs/2.png'),
                                          fit: BoxFit.cover)),
                                ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black45,
                        size: 16.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Flexible(
                          child: FittedBox(
                              child: Text(
                        'Walter street, Wallington, New York.',
                        style: getCustomFont(
                            size: 13.0,
                            color: Colors.black45,
                            weight: FontWeight.w500),
                      ))),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: BLUECOLOR,
                      size: 16.0,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Call Now',
                      style: getCustomFont(
                          size: 12.0,
                          color: Colors.black45,
                          weight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );

Widget getPharmacy(context, Function brand, {onBack}) => Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => onBack(),
                          child: Icon(Icons.arrow_back_ios,
                              size: 19.0, color: Colors.black)),
                      const SizedBox(width: 10.0),
                      Image.asset('assets/imgs/logo.png',
                          width: 150.0, fit: BoxFit.contain),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      null,
                      size: 19.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Hello, John Doe',
                style: getCustomFont(
                    size: 14.0, color: Colors.black45, weight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Order Medicine By Pharmacy',
                style: getCustomFont(
                    size: 19.0, color: Colors.black, weight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: getCardForm('Search For Pharmacy Stores'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Shop By Brand',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.black45),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => brand(),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  'view all',
                                  style: getCustomFont(
                                      size: 14.0, color: BLUECOLOR),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            ...shop_by_categgory.map((e) => firstScroll(e))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Pharmacy near you',
                                style: getCustomFont(
                                    size: 14.0, color: Colors.black45),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                'view all',
                                style:
                                    getCustomFont(size: 14.0, color: BLUECOLOR),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListView.builder(
                        padding: const EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (ctx, i) =>
                            hospitalItem(context, 'Pharmacy')),
                    const SizedBox(
                      height: 85.0,
                    ),
                  ],
                ),
              ),
            )
          ]),
    );

Widget getProfile(index, BuildContext context, callBack, headers, {dash}) =>
    Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
          width: MediaQuery.of(context).size.width,
          height: 86.0,
          color: BLUECOLOR,
          child: Column(children: [
            const SizedBox(
              height: 28.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    child: Icon(null, size: 19.0, color: Colors.white)),
                Text('Medical Record',
                    style: getCustomFont(size: 17.0, color: Colors.white)),
                InkWell(
                  // onTap: () {
                  //   context.read<HomeController>().setPage(12);
                  //   Get.back();
                  // },
                  child: Icon(
                    null,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ]),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...headers.map((e) => _dashList(e, index, dash)).toList()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                index == 'Appointments'
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            ...List.generate(
                                5, (index) => appointmentItem(context)),
                            const SizedBox(
                              height: 75.0,
                            )
                          ]),
                        ),
                      )
                    : index == 'Prescriptions'
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                ...List.generate(
                                    5, (index) => prescriptionItem(context)),
                                const SizedBox(
                                  height: 75.0,
                                )
                              ]),
                            ),
                          )
                        : index == 'Medical Records'
                            ? Expanded(
                                child: SingleChildScrollView(
                                    child: Column(children: [
                                  tableInvoice(context),
                                  const SizedBox(
                                    height: 75.0,
                                  )
                                ])),
                              )
                            : index == 'Overview'
                                ? Expanded(child: patientProfile(context))
                                : Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        ...List.generate(
                                            5, (index) => billingItem(context)),
                                        const SizedBox(
                                          height: 75.0,
                                        )
                                      ]),
                                    ),
                                  )
              ],
            ),
          ),
        ),
      ],
    );

Widget _dashList(e, index, callBack) => GestureDetector(
      onTap: () => callBack(e),
      child: Container(
          margin: const EdgeInsets.only(right: 3.0),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: index == e ? BLUECOLOR : Colors.transparent,
              borderRadius: BorderRadius.circular(50.0)),
          child: Text(
            '$e',
            style: getCustomFont(
                size: 14.0,
                color: index == e ? Colors.white : Colors.black,
                weight: FontWeight.normal),
          )),
    );

Widget appointmentItem(context) {
  return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: FittedBox(
                child: Text(
                  'Booking Date - 16 Mar 2022',
                  style: getCustomFont(
                      size: 14.0, color: Colors.black, weight: FontWeight.w400),
                ),
              )),
              Text(
                'dental',
                style: getCustomFont(
                    size: 13.5, color: Colors.black45, weight: FontWeight.w400),
              )
            ],
          ),
          Divider(),
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Ruby Perrln',
                    style: getCustomFont(
                        color: Colors.black,
                        size: 17.0,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    'Appt Date - 22 Mar 2020, 4:30PM',
                    style: getCustomFont(
                        color: Colors.black54,
                        size: 13.0,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '\$150.00',
                    style: getCustomFont(
                        color: Colors.black,
                        size: 13.0,
                        weight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getButton(context, () {}),
              const SizedBox(
                width: 10.0,
              ),
              getButton(context, () {},
                  icon: Icons.check, text: 'Confirm', color: Colors.lightGreen),
              const SizedBox(
                width: 10.0,
              ),
              getButton(context, () {},
                  icon: Icons.print, text: 'Reschedule', color: Colors.orange),
            ],
          )
        ],
      ));
}

Widget getButton(context, callBack,
        {text = 'View',
        icon = Icons.remove_red_eye,
        color = Colors.lightBlueAccent}) =>
    GestureDetector(
      onTap: () => callBack(),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 14.0,
                color: Colors.white,
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                '$text',
                style: getCustomFont(
                    size: 14.0, color: Colors.white, weight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );

Widget prescriptionItem(context) {
  return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: FittedBox(
                child: Text(
                  'Prescription 1',
                  style: getCustomFont(
                      size: 14.0, color: Colors.black, weight: FontWeight.w400),
                ),
              )),
              Text(
                '14 Mar 2022',
                style: getCustomFont(
                    size: 13.5, color: Colors.black45, weight: FontWeight.w400),
              )
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ruby Perrln',
                      style: getCustomFont(
                          color: Colors.black,
                          size: 17.0,
                          weight: FontWeight.w400),
                    ),
                    Text(
                      'Dental',
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 13.0,
                          weight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        getButton(context, () {},
                            color: Colors.lightGreen.shade300),
                        const SizedBox(
                          width: 10.0,
                        ),
                        getButton(context, () {},
                            icon: Icons.print,
                            text: 'Print',
                            color: Colors.grey),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ));
}

Widget medicalRecordItem(context) {
  return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                '#MR-0010',
                style: getCustomFont(
                    size: 15.0, color: Colors.black, weight: FontWeight.w400),
              )),
              Text(
                '14 Mar 2022',
                style: getCustomFont(
                    size: 15.0, color: Colors.black45, weight: FontWeight.w400),
              )
            ],
          ),
          Divider(),
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ruby Perrln',
                      style: getCustomFont(
                          color: Colors.black,
                          size: 19.0,
                          weight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dental',
                          style: getCustomFont(
                              color: Colors.black54,
                              size: 14.0,
                              weight: FontWeight.w400),
                        ),
                        Flexible(
                          child: Text(
                            'Dental Filling',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 13.0,
                                weight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Dental-test.pdf',
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 14.0,
                          weight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        getButton(context, () {},
                            color: Colors.lightGreen.shade300),
                        const SizedBox(
                          width: 10.0,
                        ),
                        getButton(context, () {},
                            icon: Icons.print,
                            text: 'Print',
                            color: Colors.grey),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ));
}

Widget billingItem(context) {
  return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: FittedBox(
                child: Text(
                  '#MR-0010',
                  style: getCustomFont(
                      size: 14.0, color: Colors.black, weight: FontWeight.w400),
                ),
              )),
              Text(
                'Paid on - 14 Mar 2022',
                style: getCustomFont(
                    size: 13.5, color: Colors.black45, weight: FontWeight.w400),
              )
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Ruby Perrln',
                      maxLines: 1,
                      style: getCustomFont(
                          color: Colors.black,
                          size: 17.0,
                          weight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dental',
                          style: getCustomFont(
                              color: Colors.black54,
                              size: 13.0,
                              weight: FontWeight.w400),
                        ),
                        Flexible(
                          child: Text(
                            '\$450',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 13.0,
                                weight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Dental-test.pdf',
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 13.0,
                          weight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        getButton(context, () {},
                            color: Colors.lightGreen.shade300),
                        const SizedBox(
                          width: 10.0,
                        ),
                        getButton(context, () {},
                            icon: Icons.print,
                            text: 'Print',
                            color: Colors.grey),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ));
}

Widget patientProfile(context) => Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage('assets/imgs/1.png'),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Michelle Fairfax',
                                  style: getCustomFont(
                                      color: Colors.black,
                                      size: 22.0,
                                      weight: FontWeight.w400),
                                ),
                                Text(
                                  'Patient ID - PT0025',
                                  style: getCustomFont(
                                      color: Colors.black54,
                                      size: 13.0,
                                      weight: FontWeight.w400),
                                ),
                                Text(
                                  'Blood Group - O+',
                                  style: getCustomFont(
                                      color: Colors.black54,
                                      size: 13.0,
                                      weight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Icon(Icons.phone,
                                    size: 15.0, color: Colors.black),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  '+1 504 368 6874',
                                  style: getCustomFont(
                                      color: Colors.black54,
                                      size: 13.0,
                                      weight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                      size: 13.0,
                                      weight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
                          'About Me',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 17.0,
                              weight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          '$DUMMYTEXT',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 13.0,
                              weight: FontWeight.w400),
                        ),
                      ])),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
                          'Last Booking',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 17.0,
                              weight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ...List.generate(2, (index) => lastBooking())
                      ])),
            )
          ],
        ),
        const SizedBox(
          height: 75.0,
        )
      ],
    );

Widget lastBooking() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check, size: 14.0, color: Colors.black),
            const SizedBox(
              width: 3.0,
            ),
            Text(
              'Last Booking',
              style: getCustomFont(
                  color: Colors.black, size: 17.0, weight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(
          height: 1.0,
        ),
        Text(
          'Dentist',
          style: getCustomFont(
              color: Colors.black54, size: 14.0, weight: FontWeight.w400),
        ),
        const SizedBox(
          height: 1.0,
        ),
        Text(
          '15 Nov 2022 4:00 PM',
          style: getCustomFont(
              color: Colors.black54, size: 13.0, weight: FontWeight.w400),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );

Widget tableInvoice(context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Table(
          defaultColumnWidth: FixedColumnWidth(120),
          border: TableBorder.all(
              color: Colors.grey.shade300, style: BorderStyle.solid, width: 1),
          children: [
            TableRow(children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('#',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('Name',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('BMI',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('Heart Rate',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('FBC Status',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('Weight',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('Order Date',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('Action',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.bold,
                          color: Colors.black)),
                )
              ]),
            ]),
            TableRow(children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('1',
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('John Doe',
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('23.7',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('92',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('140',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('14.2kg',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('3-Nov-2022',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Text('Action',
                      maxLines: 1,
                      style: getCustomFont(
                          size: 15.0,
                          weight: FontWeight.normal,
                          color: Colors.black45)),
                )
              ]),
            ]),
          ],
        ),
      ],
    ),
  );
}

Widget getAboutPage(totalFacility, width, controller) => SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: width,
              padding: const EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Facilities',
                    style: getCustomFont(
                        size: 16.0,
                        color: Colors.black45,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ...List.generate(
                      totalFacility > 5 ? 5 : totalFacility,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              'Emergency Ward',
                              style: getCustomFont(
                                  size: 13.5,
                                  color: Colors.black,
                                  weight: FontWeight.w500),
                            ),
                          )),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Visibility(
                    visible: totalFacility > 5,
                    child: Text(
                      '+ ${totalFacility - 5} more',
                      style: getCustomFont(
                          size: 14.0,
                          color: BLUECOLOR,
                          weight: FontWeight.w500),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 8.0,
          ),
          Container(
              width: width,
              height: 250.0,
              padding: const EdgeInsets.all(15.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                    style: getCustomFont(
                        size: 16.0,
                        color: Colors.black45,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(37.456564565, -122.67574746747),
                          zoom: 144746),
                      onMapCreated: (ctl) {
                        controller.complete(ctl);
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    );

Widget getDepartment() => ListView.builder(
    padding: const EdgeInsets.all(0.0),
    itemCount: 4,
    itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        'Cardiology Department',
                        style: getCustomFont(
                            size: 14.0,
                            color: Colors.black,
                            weight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: BLUECOLOR,
                  )
                ],
              ),
              Visibility(
                  visible: true,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: BLUECOLOR.withOpacity(.5),
                                image: DecorationImage(
                                    image: AssetImage('assets/imgs/4.png'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Joseph Williams',
                                  style: getCustomFont(
                                      size: 15.0,
                                      color: Colors.black,
                                      weight: FontWeight.w500),
                                ),
                                Text(
                                  'Cardiac Surgeon at Apple Hospital',
                                  style: getCustomFont(
                                      size: 12.5,
                                      color: Colors.black45,
                                      weight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                        child: FittedBox(
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Exp. ',
                                              style: getCustomFont(
                                                  size: 11.0,
                                                  color: Colors.black38),
                                              children: [
                                            TextSpan(
                                              text: '22 Years',
                                              style: getCustomFont(
                                                  size: 11.0,
                                                  color: Colors.black),
                                            )
                                          ])),
                                    )),
                                    Flexible(
                                        child: FittedBox(
                                      child: RichText(
                                          text: TextSpan(
                                              text: 'Fees. ',
                                              style: getCustomFont(
                                                  size: 11.0,
                                                  color: Colors.black38),
                                              children: [
                                            TextSpan(
                                              text: '\$22.00',
                                              style: getCustomFont(
                                                  size: 11.0,
                                                  color: Colors.black),
                                            )
                                          ])),
                                    )),
                                    Flexible(
                                        child: FittedBox(
                                      child: RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15.0,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 15.0,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ));

Widget getServices() => SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.white,
        child: Column(children: [
          item(Icons.calendar_month, '06 Jul 2022'),
          item(Icons.grid_4x4_sharp, 'Walk in'),
          item(Icons.credit_card, '\$1,400.00'),
        ]),
      ),
    );

item(icon, text) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.black45,
            size: 20.0,
          ),
          Text(text,
              style: getCustomFont(
                  size: 13.0, color: Colors.black, weight: FontWeight.w500))
        ],
      ),
    );
