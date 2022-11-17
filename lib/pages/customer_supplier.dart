import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

class CustomerAndSupplier extends StatefulWidget {
  const CustomerAndSupplier({super.key});

  @override
  State<CustomerAndSupplier> createState() => _CustomerAndSupplierState();
}

class _CustomerAndSupplierState extends State<CustomerAndSupplier> {

String past = 'Recent';

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
                      onTap: () {
                        context.read<HomeController>().onBackPress();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18.0,
                      )),
                 
                  Text('My Patients',
                      style:
                          getCustomFont(size: 16.0, color: Colors.white)),
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
            ]),
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
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 8.0, top: 15.0, bottom: 15.0),
            child: Row(
              children: [
                PhysicalModel(
                  elevation: 10.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Icon(
                      FontAwesome5.person_booth,
                      size: 19.0,
                      color: Color(0xFF838383),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Patient List',
                        style: getCustomFont(
                            size: 18.0,
                            color: Colors.black,
                            weight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        '125 patients',
                        style: getCustomFont(
                            size: 13.0,
                            color: Colors.black45,
                            weight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      boxShadow: SHADOW,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(20.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(2, (index) => patientItem(context)),
                        const SizedBox(
                          height: 50.0,
                        )
                      ],
                    ),
                  )))
        ]));
  }
}
