import 'dart:io';

import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class MyDashBoard extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  const MyDashBoard(this.scaffold, {super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  String selected = 'Today';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                widget.scaffold.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 18.0,
                              )),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text('Dashboard',
                              style: getCustomFont(
                                  size: 16.0, color: Colors.white)),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          context.read<HomeController>().setPage(-22);
                        },
                        child: Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                ]),
              ),
              SizedBox(
                height: Platform.isAndroid ? 80.0 : 80.0,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: dashWidget(context, progress: 0.6),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Flexible(
                            child: dashWidget(context,
                                result: 160,
                                text: 'Total Suppliers',
                                icon: Icons.medication_liquid,
                                progress: 0.3),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Flexible(
                              child: appointmentButton(
                                  context, 'Today\'s\nAppointment')),
                          Flexible(
                              child: appointmentButton(
                                  context, 'Upcoming\nAppointment')),
                                   Flexible(
                              child: appointmentButton(
                                  context, 'Upcoming\nAppointment')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4.0),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: SHADOW,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text('Insight',
                                    style: getCustomFont(
                                        size: 15.0,
                                        color: Colors.black,
                                        weight: FontWeight.w500))),
                            DropdownButton(
                                underline: SizedBox(),
                                iconEnabledColor: Colors.green,
                                iconSize: 20.0,
                                value: selected,
                                items: ['Today', 'Weekly', 'Monthly', 'Total']
                                    .map((String value) => DropdownMenuItem(
                                          value: value,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                value,
                                                style: getCustomFont(
                                                    size: 14.0,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {}),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: SHADOW,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('64',
                                        style: getCustomFont(
                                            size: 14.0,
                                            color: Colors.black,
                                            weight: FontWeight.bold)),
                                    const SizedBox(height: 1.0),
                                    Text('Orders',
                                        style: getCustomFont(
                                            size: 13.0,
                                            color: Colors.black87,
                                            weight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('\$7.8k',
                                        style: getCustomFont(
                                            size: 14.0,
                                            color: Colors.black,
                                            weight: FontWeight.bold)),
                                    const SizedBox(height: 1.0),
                                    Text('Revenue',
                                        style: getCustomFont(
                                            size: 13.0,
                                            color: Colors.black87,
                                            weight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Text('14',
                                        style: getCustomFont(
                                            size: 14.0,
                                            color: Colors.black,
                                            weight: FontWeight.bold)),
                                    const SizedBox(height: 1.0),
                                    Text('Pending',
                                        style: getCustomFont(
                                            size: 13.0,
                                            color: Colors.black87,
                                            weight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 10.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: SHADOW,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 8.0,
                            percent: 0.5,
                            center: Image.asset(
                              'assets/imgs/wallet.png',
                              height: 30.0,
                              width: 30.0,
                              fit: BoxFit.contain,
                            ),
                            backgroundColor: Colors.grey.shade100,
                            progressColor:
                                Colors.lightBlueAccent.withOpacity(.7),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Today\'s Income',
                                  style: getCustomFont(
                                      size: 16.0, color: Colors.black45)),
                              Text('\$1454.00',
                                  style: getCustomFont(
                                      size: 19.0,
                                      color: Colors.black,
                                      weight: FontWeight.bold)),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.red, size: 20.0),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('5.5%',
                                      style: getCustomFont(
                                          size: 13.0,
                                          color: Colors.red,
                                          weight: FontWeight.normal)),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text('Yesterday',
                                      style: getCustomFont(
                                          size: 13.0,
                                          color: Colors.black45,
                                          weight: FontWeight.normal)),
                                ],
                              )
                            ])
                      ]),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: SHADOW,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Text('Recent Prescription',
                                          style: getCustomFont(
                                              size: 13.0,
                                              color: Colors.black,
                                              weight: FontWeight.w500))),
                                  Row(
                                    children: [
                                      Text('View All',
                                          style: getCustomFont(
                                              size: 13.0, color: Colors.red)),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 19.0,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                ]),
                            Divider(),
                            const SizedBox(height: 10.0),
                            ...List.generate(2, (i) => prescription())
                          ],
                        )),
                    const SizedBox(height: 80.0),
                  ],
                ),
              ))
            ])),
        dashHeader(context),
      ],
    );
  }

  Widget prescription() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    child: Row(
          children: [
            Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/imgs/pills.png'), fit: BoxFit.contain, scale: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.lightBlueAccent),
            ), const SizedBox(width: 20.0,),
            Flexible(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Abacavoir', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.bold)),
                  Text('#8995447', style: getCustomFont(size: 12.0, color: Colors.red, weight: FontWeight.normal)),
                ],),
              ),
              Text('Type: Onetime', style: getCustomFont(size: 12.0, color: Colors.black54, weight: FontWeight.normal)),
            ]),)
          ],
        ),
  );
}
