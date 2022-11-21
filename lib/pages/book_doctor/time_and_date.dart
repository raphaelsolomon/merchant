// ignore_for_file: must_be_immutable
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/model/timeing_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class TimeAndDate extends StatefulWidget {
  TimeAndDate({Key? key}) : super(key: key);

  @override
  State<TimeAndDate> createState() => _TimeAndDateState();
}

class _TimeAndDateState extends State<TimeAndDate> {
  List<String> headers = ['Time and Date', 'Booking', 'Checkout', 'Payment'];
  List CONSULT_TYPE = [
    {'title': 'Audio Call', 'icon': Icons.spatial_audio},
    {'title': 'Video Call', 'icon': FontAwesome5.video},
    {'title': 'Chat', 'icon': FontAwesome5.facebook_messenger},
    {'title': 'Physical Visit', 'icon': FontAwesome5.walking}
  ];
  var _selected  = DateTime.now();
  String type = 'Audio Call';

  List<TimingModel> timemodel = [
    TimingModel(
        from: DateFormat('hh:mm a').format(DateTime.now()),
        to: DateFormat('hh:mm a').format(DateTime.now())),
    TimingModel(
        from: DateFormat('hh:mm a').format(DateTime.now()),
        to: DateFormat('hh:mm a').format(DateTime.now())),
    TimingModel(
        from: DateFormat('hh:mm a').format(DateTime.now()),
        to: DateFormat('hh:mm a').format(DateTime.now())),
    TimingModel(
        from: DateFormat('hh:mm a').format(DateTime.now()),
        to: DateFormat('hh:mm a').format(DateTime.now())),
    TimingModel(
        from: DateFormat('hh:mm a').format(DateTime.now()),
        to: DateFormat('hh:mm a').format(DateTime.now())),
    TimingModel(
        from: DateFormat('hh:mm a').format(DateTime.now()),
        to: DateFormat('hh:mm a').format(DateTime.now())),
  ];

  String index = 'Time and Date';
  int currentMonthDate = 0;

  @override
  void initState() {
    currentMonthDate = DateTime.now().month - 1;
    super.initState();
  }

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
                    Text('Time And Date',
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...headers.map((e) => _dashList(e)).toList()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  index == 'Time and Date'
                      ? getCalenderYear(context)
                      : index == 'Checkout'
                          ? checkOut(context)
                          : index == 'Booking'
                              ? getPlans(context)
                              : getPaymentWidget(context)
                ],
              ),
            )
          ],
        ));
  }

  Widget getPlans(context) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...CONSULT_TYPE.map((e) => _dashTypeList(e)).toList()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                getBookingForm(),
                const SizedBox(
                  height: 30.0,
                ),
                getButton1(context, () {
                  setState(() {
                    index = 'Checkout';
                  });
                })
              ],
            ),
          ),
        ),
      );

  Widget _dashList(e) => GestureDetector(
        onTap: () => setState(() => index = e),
        child: Container(
            margin: const EdgeInsets.only(right: 5.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
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

  Widget _dashTypeList(e) => GestureDetector(
        onTap: () => setState(() => type = e['title']),
        child: Container(
            margin: const EdgeInsets.only(right: 5.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            decoration: BoxDecoration(
                color: type == e['title'] ? BLUECOLOR : Colors.transparent,
                borderRadius: BorderRadius.circular(50.0)),
            child: Row(
              children: [
                Icon(
                  e['icon'],
                  color: type == e['title'] ? Colors.white : Colors.black,
                  size: 14.0,
                ),
                const SizedBox(width: 10),
                Text(
                  '${e['title']}',
                  style: getCustomFont(
                      size: 14.0,
                      color: type == e['title'] ? Colors.white : Colors.black,
                      weight: FontWeight.normal),
                ),
              ],
            )),
      );

  Widget circularButton(icon, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(width: 1.0, color: Colors.black26),
            color: Colors.white,
          ),
          child: Center(
              child: Icon(
            icon,
            color: Colors.black,
            size: 16.0,
          )),
        ),
      );

  //---------------------PAGE 1-----------------------------
  Widget getTimeItems(TimingModel timingModel, int i, context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1.0,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 1.0))
            ]),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                'Timings',
                style: getCustomFont(size: 14.0, color: Colors.black),
              )),
              Icon(
                Icons.timer_outlined,
                size: 18.0,
              )
            ],
          ),
          Divider(),
          Row(
            children: [
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From',
                    style: getCustomFont(size: 14.0, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 35.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                          child: FittedBox(
                        child: Text(
                          timingModel.timerFrom,
                          maxLines: 1,
                          style:
                              getCustomFont(size: 13.0, color: Colors.black45),
                        ),
                      )),
                    ),
                  )
                ],
              )),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'To',
                    style: getCustomFont(size: 14.0, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 35.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                          child: FittedBox(
                        child: Text(
                          timingModel.timerTo,
                          maxLines: 1,
                          style:
                              getCustomFont(size: 14.0, color: Colors.black45),
                        ),
                      )),
                    ),
                  )
                ],
              ))
            ],
          )
        ]),
      );

  Widget getCalenderYear(context) {
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.0,
                                blurRadius: 10.0,
                                offset: Offset(0.0, 1.0))
                          ]),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: BLUECOLOR,
                        dayTextStyle: getCustomFont(color: Colors.black, size: 10.0),
                        dateTextStyle: getCustomFont(color: Colors.black, size: 19.0),
                        monthTextStyle: getCustomFont(color: Colors.black, size: 10.0),
                        onDateChange: (date) {
                          _selected = date;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GridView.builder(
                        padding: const EdgeInsets.all(0.0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: returnCrossAxis(width),
                            mainAxisSpacing: 15.0,
                            mainAxisExtent: 120,
                            crossAxisSpacing: 8.0),
                        itemCount: timemodel.length,
                        itemBuilder: (ctx, i) =>
                            getTimeItems(timemodel[i], i, context)),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
            getButton1(context, () {
              setState(() {
                index = 'Booking';
              });
            })
          ],
        ),
      ),
    );
  }

  //======================PAYMENT==============================
  getPaymentWidget(context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 11.0),
                decoration: BoxDecoration(
                    color: BLUECOLOR, borderRadius: BorderRadius.circular(8.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Amount to pay ',
                        style: getCustomFont(color: Colors.white, size: 13.0)),
                    Text('\$31.0 ',
                        style: getCustomFont(
                            color: Colors.white,
                            size: 15.0,
                            weight: FontWeight.w700)),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                dashPattern: [8, 4],
                strokeCap: StrokeCap.butt,
                color: Colors.black,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.wallet_giftcard,
                                color: Colors.lightBlue),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text('Wallet ',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 16.0,
                                    weight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          dialogMessage(context, walletTop(context));
                        },
                        child: Text('\$314.50 ',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 15.0,
                                weight: FontWeight.w700)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Cards',
                style: getCustomFont(
                    weight: FontWeight.bold, size: 20.0, color: Colors.black45),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // items(Icons.credit_card, 'Debit Card'),
              // Divider(),
              items(FontAwesome5.credit_card, 'Credit Card'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Cash',
                style: getCustomFont(
                    weight: FontWeight.bold, size: 20.0, color: Colors.black45),
              ),
              const SizedBox(
                height: 10.0,
              ),
              items(Icons.money, 'Cash on Delivery'),
              Divider(),
              items(FontAwesome5.cash_register, 'Pay cash on spot'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Bank',
                style: getCustomFont(
                    weight: FontWeight.bold, size: 20.0, color: Colors.black45),
              ),
              const SizedBox(
                height: 10.0,
              ),
              items(Icons.money, 'USSD'),
              Divider(),
              items(FontAwesome5.cash_register, 'Cheque Payment'),
              Divider(),
              items(Icons.money, 'Bank Transfer'),
              Divider(),
              items(FontAwesome5.cash_register, 'Net Banking'),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Others',
                style: getCustomFont(
                    weight: FontWeight.bold, size: 20.0, color: Colors.black45),
              ),
              const SizedBox(
                height: 10.0,
              ),
              items(FontAwesome5.amazon_pay, 'Paystack'),
              Divider(),
              items(FontAwesome5.amazon_pay, 'Razor Pay'),
            ],
          ),
        ),
      ),
    );
  }

  Widget items(icon, text) => Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(
                  width: 15.0,
                ),
                Flexible(
                  child: Text('$text',
                      style: getCustomFont(
                          color: Colors.black,
                          size: 14.0,
                          weight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 10.0,
              width: 10.0,
              child: Radio(onChanged: (b) {}, value: false, groupValue: true)),
          const SizedBox(
            width: 20.0,
          )
        ],
      );

  getCardForm(label, hint, {ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '$label',
                style: getCustomFont(size: 13.0, color: Colors.black45),
              ),
              Text(
                '*',
                style: getCustomFont(color: Colors.red, size: 13.0),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 45.0,
            child: TextField(
              style: getCustomFont(size: 14.0, color: Colors.black45),
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0))),
            ),
          )
        ],
      ),
    );
  }

  getDropDownAssurance() {
    return Container(
      width: 150.0,
      height: 40.0,
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(8.0)),
      child: FormBuilderDropdown(
        name: 'skill',
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        initialValue: 'Aetna',
        items: ['Aetna', 'LifeGuard']
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: getCustomFont(size: 13.0, color: Colors.black),
                  ),
                ))
            .toList(),
      ),
    );
  }

  getCouponCode({ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                style: getCustomFont(size: 14.0, color: Colors.black45),
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Coupon Code',
                    contentPadding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 3.0),
                    hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                color: BLUECOLOR,
              ),
              child: Center(
                  child: Text(
                'Apply',
                style: getCustomFont(size: 15.0, color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget getPayButton(context, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(50.0)),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Center(
              child: Text(
                'Confirm And Pay',
                style: GoogleFonts.poppins(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );

  int returnCrossAxis(width) {
    return width < 500
        ? 2
        : width > 500 && width < 100
            ? 2
            : 3;
  }

  Widget getButton1(context, callBack, {text = 'Continue'}) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      );
  //-----------------------PAGE 2 -----------------------------
  Widget checkOut(context) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                    boxShadow: SHADOW),
                child: Row(children: [
                  CircleAvatar(
                    radius: 30.0,
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
                            weight: FontWeight.w500),
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
                          Text(
                            '(47)',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 13.0,
                                weight: FontWeight.w400),
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
                            size: 14.0,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Florida, USA',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 13.0,
                                weight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'Booking Summary',
                style: getCustomFont(
                    size: 18.0, color: Colors.black, weight: FontWeight.normal),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children:
                      List.generate(1, (index) => bookSummaryItem(context)),
                ),
              )),
              getButton(context, () {
                setState(() {
                  index = 'Payment';
                });
              })
            ],
          ),
        ),
      );

  bookSummaryItem(context) => Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
              Text(
                'Date',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '16 Nov 2022',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '10:00 AM',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking Type',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Video call',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Patient Country',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Nigeria',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Consulting Fee',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$100.0',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Slot Timing Fees',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$10.0',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Video Call',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$50.0',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 9.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Amount',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$160.0',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            'Apply a coupon code',
            style: GoogleFonts.poppins(
                color: Colors.lightBlueAccent,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15.0,
          ),
          getCouponCode(),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount(10% Off)',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$16.0',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$144.0',
                style: GoogleFonts.poppins(
                    color: Colors.black45,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ));

  Widget getButton(context, callBack, {text = 'Search Now'}) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(50.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total - \$144',
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      );

  //-----------------------BOOKING FORM---------------------------
  getBookingForm() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(13.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(width: 1.0, color: Colors.black45)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You are booking a visit with Dr. Rajendra Mohanlal Gandhi. Please enter your booking details below.',
                  style: getCustomFont(size: 13.0, color: Colors.black),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Are you booking for yourself?',
                  style: getCustomFont(size: 13.0, color: Colors.black),
                ),
                Row(
                  children: [
                    Row(children: [
                      Radio(value: false, groupValue: true, onChanged: (b) {}),
                      Text(
                        'Yes',
                        style: getCustomFont(size: 13.0, color: Colors.black),
                      ),
                    ]),
                    Row(children: [
                      Radio(value: false, groupValue: true, onChanged: (b) {}),
                      Text(
                        'No',
                        style: getCustomFont(size: 13.0, color: Colors.black),
                      ),
                    ])
                  ],
                ),
                Text(
                  'Patient Name',
                  style: getCustomFont(size: 13.0, color: Colors.black),
                ),
                TextFormField(
                  style: getCustomFont(size: 13.0, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Enter Patient Name',
                    hintStyle: getCustomFont(size: 13.0, color: Colors.black45),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Do you have insurance?',
                  style: getCustomFont(size: 13.0, color: Colors.black),
                ),
                Row(
                  children: [
                    Row(children: [
                      Radio(value: false, groupValue: true, onChanged: (b) {}),
                      Text(
                        'Yes',
                        style: getCustomFont(size: 13.0, color: Colors.black),
                      ),
                    ]),
                    Row(children: [
                      Radio(value: false, groupValue: true, onChanged: (b) {}),
                      Text(
                        'No',
                        style: getCustomFont(size: 13.0, color: Colors.black),
                      ),
                    ])
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                getDropDownAssurance(),
              ],
            )),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          style: getCustomFont(size: 13.0, color: Colors.black),
          maxLines: 10,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              hintText: 'Enter Patient Name',
              hintStyle: getCustomFont(size: 13.0, color: Colors.black45),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(width: 1.0, color: Colors.black))),
        ),
      ],
    );
  }
}
