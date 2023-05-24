import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/request_form.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/dialog/top_up.dart';
import 'package:merchant/dialog/withdraw.dart';
import 'package:merchant/providers/page_controller.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
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
                  Text('Account', style: getCustomFont(color: Colors.white, size: 16.0)),
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
                  height: 20.0,
                ),
                addAndTopUp(context),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(color: Colors.greenAccent.shade400, borderRadius: BorderRadius.circular(8.0)),
                      child: FittedBox(
                        child: Text('Refund Request', style: getCustomFont(color: Colors.white, size: 13.0, weight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Transactions',
                    style: getCustomFont(size: 15.0, color: Colors.black, weight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                transactionHeader(),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ...List.generate(
                          5,
                          (index) => Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(color: Colors.white, boxShadow: SHADOW, borderRadius: BorderRadius.circular(15.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 6.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0))),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              'Credit card deposit(payment ID: 94943978743)',
                                              style: getCustomFont(color: BLUECOLOR, size: 13.0),
                                            ),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              '20 Monday June, 08.48.00 GMT',
                                              style: getCustomFont(size: 11.0, color: Colors.black45),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      child: Text(
                                        '\$200.00',
                                        style: getCustomFont(size: 11.0, color: Colors.black, weight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                      const SizedBox(
                        height: 80.0,
                      )
                    ]),
                  ),
                )
              ],
            ),
          ))
        ]));
  }

  Widget transactionHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10.0)),
          child: Row(children: [
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'All';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  child: Center(
                    child: Text('Doctor', style: getCustomFont(size: 13.0, color: selected == 'All' ? BLUECOLOR : Colors.black45, weight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Credit';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: selected == 'Credit' ? BLUECOLOR : Colors.transparent),
                  child: Center(
                    child: Text('Patient Refund', maxLines: 1, style: getCustomFont(size: 13.0, color: selected == 'Credit' ? BLUECOLOR : Colors.black45, weight: FontWeight.w500)),
                  ),
                ),
              ),
            ),
          ]),
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                decoration: BoxDecoration(color: Colors.green.shade100.withOpacity(.5), borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text('Earned', style: getCustomFont(color: Colors.green, size: 13.0, weight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 3.0),
                    FittedBox(
                      child: Text('\$0.0', style: getCustomFont(color: Colors.green, size: 13.0, weight: FontWeight.bold)),
                    ),
                  ],
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                decoration: BoxDecoration(color: Colors.amber.shade100.withOpacity(.5), borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text('Request', style: getCustomFont(color: Colors.amber, size: 13.0, weight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 3.0),
                    FittedBox(
                      child: Text('\$0.0', style: getCustomFont(color: Colors.amber, size: 13.0, weight: FontWeight.bold)),
                    ),
                  ],
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                decoration: BoxDecoration(color: Colors.purple.shade100.withOpacity(.5), borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text('Balance', style: getCustomFont(color: Colors.purple, size: 13.0, weight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 3.0),
                    FittedBox(
                      child: Text('\$0.0', style: getCustomFont(color: Colors.purple, size: 13.0, weight: FontWeight.bold)),
                    ),
                  ],
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: Colors.white, boxShadow: SHADOW),
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
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Dr. Michelle Fairfax',
                            style: getCustomFont(color: Colors.black, size: 17.0, weight: FontWeight.w500),
                          ),
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 18.0,
                        )
                      ],
                    ),
                    Text(
                      'Wells Fargo & Co.',
                      style: getCustomFont(color: Colors.black54, size: 13.0, weight: FontWeight.w600),
                    ),
                    Text(
                      '2342 **** **** 2343',
                      style: getCustomFont(color: Colors.black54, size: 13.0, weight: FontWeight.w500),
                    ),
                    Text(
                      'Lenexa.',
                      style: getCustomFont(color: Colors.black54, size: 13.0, weight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ));
}
