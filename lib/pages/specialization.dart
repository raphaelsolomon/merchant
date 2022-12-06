import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Specialization extends StatelessWidget {
  const Specialization({Key? key}) : super(key: key);

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
                width: MediaQuery.of(context).size.width,
                color: BLUECOLOR,
                child: Column(children: [
                  const SizedBox(
                    height: 45.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () =>
                                context.read<HomeController>().onBackPress(),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18.0,
                            )),
                        Text('Search Specialization',
                            style:
                                getCustomFont(color: Colors.white, size: 16.0)),
                        InkWell(
                          onTap: () {
                            context.read<HomeController>().setPage(-23);
                          },
                          child: Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  const SizedBox(
                    height: 15.0,
                  ),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 60.0),
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 30.0, bottom: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          color: BLUECOLOR),
                      child: Text(
                        'Select your Speciality',
                        style: getCustomFont(size: 14.0, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ...List.generate(7, (i) => viewAllSpecial(context))
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              )
            ])),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton(
              tooltip: 'Save',
              child: Icon(
                Icons.check_sharp,
                color: Colors.white,
              ),
              onPressed: () {},
              backgroundColor: BLUECOLOR,
            ),
          ),
        ),
      ],
    );
  }

  Widget viewAllSpecial(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 9.0),
        child: Column(
          children: [
            Row(children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Addiction psychiatrists',
                    style: getCustomFont(size: 14.0, color: Colors.black87),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child:
                    Icon(Icons.check_circle, size: 18.0, color: Colors.green),
              )
            ]),
            const SizedBox(
              height: 1.0,
            ),
            Divider(),
            const SizedBox(
              height: 1.0,
            ),
          ],
        ),
      );
}
