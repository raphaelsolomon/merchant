import 'package:merchant/company/invoice_receipt.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyInvoicePage extends StatefulWidget {
  const MyInvoicePage({Key? key}) : super(key: key);

  @override
  State<MyInvoicePage> createState() => _MyInvoicePageState();
}

class _MyInvoicePageState extends State<MyInvoicePage> {
  String past = "Service";

  @override
  void initState() {
    super.initState();
  }

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
                height: 43.0,
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
                  Text('Invoices',
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
          const SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: SHADOW),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    past = 'Service';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: past == 'Service' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'Service' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'Service',
                      style: getCustomFont(
                          size: 13.0,
                          color:
                              past == 'Service' ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    past = 'Product';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: past == 'Product' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'Product' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'Product',
                      style: getCustomFont(
                          size: 13.0,
                          color:
                              past == 'Product' ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(6, (index) => invoiceItem()),
                  const SizedBox(
                    height: 90.0,
                  ),
                ],
              ),
            ),
          ))
        ]));
  }

  Widget invoiceItem() {
    return Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: SHADOW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  '#MR-0010',
                  style: getCustomFont(
                      size: 12.0, color: Colors.black, weight: FontWeight.w400),
                )),
                Text(
                  'Paid on - 14 Mar 2022',
                  style: getCustomFont(
                      size: 12.0,
                      color: Colors.black45,
                      weight: FontWeight.w400),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Michelle Fairfax',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 15.0,
                                weight: FontWeight.w400),
                          ),
                          Flexible(
                            child: Text(
                              '\$450',
                              style: getCustomFont(
                                  color: Colors.black,
                                  size: 13.0,
                                  weight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        '#PT0025',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.0,
                            weight: FontWeight.w400),
                      ),
                      const SizedBox(height: 3.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: getButton(context, () {
                           showRequestSheet(context, InvoiceReceipt());
                          }),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 14.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 6.0,
                ),
                Flexible(
                  child: Text(
                    '$text',
                    maxLines: 1,
                    style: getCustomFont(
                        size: 12.0,
                        color: Colors.white,
                        weight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
