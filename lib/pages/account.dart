import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/request_form.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/dialog/top_up.dart';
import 'package:merchant/dialog/withdraw.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String selected = 'All';
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
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
                      onTap: () => context.read<HomeController>().onBackPress(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18.0,
                      )),
                  Text('Account',
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                patientItem(context),
                const SizedBox(
                  height: 30.0,
                ),
                balance(context),
                const SizedBox(
                  height: 20.0,
                ),
                addAndTopUp(context),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Recent Transactions',
                    style: getCustomFont(
                        size: 17.0,
                        color: Colors.black45,
                        weight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
               transactionHeader(),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(child: SingleChildScrollView(
                  child: Column(children: [
                    ...List.generate(5, (index) => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: SHADOW,
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Container(
                          width: 10.0,
                          height: 65.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0))
                        ),
                      ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Credit card deposit(payment ID: 94943978743)', style: getCustomFont(color: BLUECOLOR, size: 12.0),)
                                ,Text('20 Monday June, 08.48.00 GMT',style: getCustomFont(size: 11.0, color: Colors.black45),)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('\$200.00',style: getCustomFont(size: 12.0, color: Colors.black, weight: FontWeight.w500),),
                        )
                      ],
                    ),
                  )),
                  const SizedBox(height: 80.0,)
                  ]),
                ),)
              ],
            ),
          ))
        ]));
  }

  Widget transactionHeader() =>  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Row(children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {setState(() {
                            selected = 'All';
                          });},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                                color: selected == 'All'
                                    ? BLUECOLOR
                                    : Colors.transparent),
                            child: Center(
                              child: Text('All',
                                  style: getCustomFont(
                                      size: 14.0,
                                      color: selected == 'All'
                                          ? Colors.white
                                          : BLUECOLOR)),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {setState(() {
                            selected = 'Credit';
                          });},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                                color: selected == 'Credit'
                                    ? BLUECOLOR
                                    : Colors.transparent),
                            child: Center(
                              child: Text('Credit',
                                  style: getCustomFont(
                                      size: 14.0,
                                      color: selected == 'Credit'
                                          ? Colors.white
                                          : BLUECOLOR)),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {setState(() {
                            selected = 'Debit';
                          });},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                                color: selected == 'Debit'
                                    ? BLUECOLOR
                                    : Colors.transparent),
                            child: Center(
                              child: Text('Debit',
                                  style: getCustomFont(
                                      size: 14.0,
                                      color: selected == 'Debit'
                                          ? Colors.white
                                          : BLUECOLOR)),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                );

  Widget balance(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(2),
          dashPattern: [8, 4],
          strokeCap: StrokeCap.butt,
          color: BLUECOLOR,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(Icons.wallet, color: Colors.lightBlue),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text('Wallet ',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 15.0,
                              weight: FontWeight.w500)),
                    ],
                  ),
                ),
                Text('\$314.50 ',
                    style: getCustomFont(
                        color: Colors.black,
                        size: 15.0,
                        weight: FontWeight.w700)),
              ],
            ),
          ),
        ),
      );

  Widget addAndTopUp(context) => Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => showRequestSheet(context, TopUp()),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                dashPattern: [8, 4],
                strokeCap: StrokeCap.butt,
                color: BLUECOLOR,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 7.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text('Top Up ',
                      style: getCustomFont(
                          color: Colors.black,
                          size: 15.0,
                          weight: FontWeight.w500)),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => showRequestSheet(context, Withdraw()),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                dashPattern: [8, 4],
                strokeCap: StrokeCap.butt,
                color: BLUECOLOR,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 7.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Center(
                    child: FittedBox(
                      child: Text('Withdraw',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 15.0,
                              weight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ),
          ),
           const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => showRequestSheet(context, RequestForm()),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                dashPattern: [8, 4],
                strokeCap: StrokeCap.butt,
                color: BLUECOLOR,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 7.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Center(
                    child: FittedBox(
                      child: Text('Request',
                          style: getCustomFont(
                              color: Colors.black,
                              size: 15.0,
                              weight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      );

  Widget patientItem(context) => Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: SHADOW),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 37.0,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Michelle Fairfax',
                      style: getCustomFont(
                          color: Colors.black,
                          size: 17.0,
                          weight: FontWeight.w500),
                    ),
                    Text(
                      'BDS, MDS - Oral & Maxillofacial Surgery',
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 13.0,
                          weight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        PhysicalModel(
                          elevation: 10.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          shadowColor: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            child: Icon(
                              Icons.phone,
                              size: 15.0,
                              color: Color(0xFF838383),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              '+1 504 368 6874',
                              style: getCustomFont(
                                  color: Colors.black54,
                                  size: 13.0,
                                  weight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ));
}
