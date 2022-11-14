import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceReceipt extends StatelessWidget {
  const InvoiceReceipt({Key? key}) : super(key: key);

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
                      onTap: () =>context.read<HomeController>().onBackPress(),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18.0,)),
                  Text('Invoice Receipt',
                      style:
                          getCustomFont(size: 16.0, color: Colors.white)),
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
            height: 15.0,
          ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/imgs/logo.png',
                            width: 150.0, fit: BoxFit.contain),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Order: ',
                                    style: getCustomFont(
                                        color: Colors.black,
                                        size: 12.0,
                                        weight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                      text: '#00123',
                                      style: getCustomFont(
                                          color: Colors.black45,
                                          size: 12.0,
                                          weight: FontWeight.w500)),
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: 'Issued: ',
                                    style: getCustomFont(
                                        color: Colors.black,
                                        size: 12.0,
                                        weight: FontWeight.bold),
                                    children: [
                                  TextSpan(
                                      text: '31/08/2022',
                                      style: getCustomFont(
                                          color: Colors.black45,
                                          size: 12.0,
                                          weight: FontWeight.w500)),
                                ])),
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Divider(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Invoice From',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 15.0,
                                    weight: FontWeight.bold)),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text('Dr. Dareen Elder',
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 15.0,
                                    weight: FontWeight.w500)),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                                '806 Twin Willow Lane, Old Forge, New-York, USA',
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 13.0,
                                    weight: FontWeight.w500)),
                          ],
                        )),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Invoice To',
                                style: getCustomFont(
                                    color: Colors.black,
                                    size: 15.0,
                                    weight: FontWeight.bold)),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text('Dr. Dareen Elder',
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 15.0,
                                    weight: FontWeight.w500)),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                                '806 Twin Willow Lane, Old Forge, New-York, USA',
                                textAlign: TextAlign.end,
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 13.0,
                                    weight: FontWeight.w500)),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Text('Payment Method',
                        style: getCustomFont(
                            color: Colors.black,
                            size: 15.0,
                            weight: FontWeight.bold)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text('Debit Card',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 15.0,
                            weight: FontWeight.w500)),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text('XXXXXXXXXXXXXXXX-2541\nHDFC Bank',
                        textAlign: TextAlign.start,
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.0,
                            weight: FontWeight.w500)),
                    const SizedBox(
                      height: 35.0,
                    ),
                    tableInvoice(context),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Flexible(child: Container()),
                        Flexible(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Order:',
                                        style: getCustomFont(
                                            color: Colors.black,
                                            size: 12.0,
                                            weight: FontWeight.bold))),
                                Text('\$350',
                                    style: getCustomFont(
                                        color: Colors.black45,
                                        size: 12.0,
                                        weight: FontWeight.w500))
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Discount:',
                                        style: getCustomFont(
                                            color: Colors.black,
                                            size: 12.0,
                                            weight: FontWeight.bold))),
                                Text('\$-10',
                                    style: getCustomFont(
                                        color: Colors.black45,
                                        size: 12.0,
                                        weight: FontWeight.w500))
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Total Amount:',
                                        style: getCustomFont(
                                            color: Colors.black,
                                            size: 12.0,
                                            weight: FontWeight.bold))),
                                Text('\$315',
                                    style: getCustomFont(
                                        color: Colors.black45,
                                        size: 12.0,
                                        weight: FontWeight.w500))
                              ],
                            ),
                            Divider(),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Text('Other information',
                        style: getCustomFont(
                            color: Colors.black,
                            size: 15.0,
                            weight: FontWeight.bold)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text('Three Hundred and fifteen dollars',
                        textAlign: TextAlign.start,
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.0,
                            weight: FontWeight.w500)),
                    Text('Thank You for your business.',
                        textAlign: TextAlign.start,
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.0,
                            weight: FontWeight.w500)),
                    const SizedBox(
                      height: 80.0,
                    ),
                  ]),
            ),
          )
        ]));
  }

  Widget tableInvoice(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Table(
            defaultColumnWidth: FixedColumnWidth(120),
            border: TableBorder.all(
                color: Colors.grey.shade300,
                style: BorderStyle.solid,
                width: 1),
            children: [
              TableRow(children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Description',
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
                    child: Text('Quantity',
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
                    child: Text('VAT',
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
                    child: Text('Total',
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
                    child: Text('General Consultation',
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
                    child: Text('1',
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
                    child: Text('\$0',
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
                    child: Text('\$100',
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
}
