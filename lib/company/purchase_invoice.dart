import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseInvoiceReceipt extends StatelessWidget {
  const PurchaseInvoiceReceipt({Key? key}) : super(key: key);

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
                  Text('Invoice Receipt',
                      style: getCustomFont(size: 15.0, color: Colors.white)),
                  InkWell(
                    onTap: () {
                      context.read<HomeController>().setPage(-22);
                    },
                    child: Icon(
                      null,
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
                                        color: Colors.black87,
                                        size: 12.0,
                                        weight: FontWeight.w500),
                                    children: [
                                  TextSpan(
                                      text: '#00123',
                                      style: getCustomFont(
                                          color: Colors.black45,
                                          size: 12.0,
                                          weight: FontWeight.w400)),
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: 'Issued: ',
                                    style: getCustomFont(
                                        color: Colors.black87,
                                        size: 12.0,
                                        weight: FontWeight.w500),
                                    children: [
                                  TextSpan(
                                      text: '31/08/2022',
                                      style: getCustomFont(
                                          color: Colors.black45,
                                          size: 12.0,
                                          weight: FontWeight.w400)),
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
                                    color: Colors.black87,
                                    size: 14.0,
                                    weight: FontWeight.bold)),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text('Dr. Bonny Elder',
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 13.0,
                                    weight: FontWeight.w400)),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                                '806 Twin Willow Lane, Old Forge, New-York, USA',
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 13.0,
                                    weight: FontWeight.w400)),
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
                                    color: Colors.black87,
                                    size: 14.0,
                                    weight: FontWeight.w500)),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text('Dr. Dareen Elder',
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 13.0,
                                    weight: FontWeight.w400)),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text(
                                '806 Twin Willow Lane, Old Forge, New-York, USA',
                                textAlign: TextAlign.end,
                                style: getCustomFont(
                                    color: Colors.black45,
                                    size: 13.0,
                                    weight: FontWeight.w400)),
                          ],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    Text('Purchase Details',
                        style: getCustomFont(
                            color: Colors.black87,
                            size: 14.0,
                            weight: FontWeight.w500)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text('Purchase ID',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.0,
                            weight: FontWeight.w400)),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text('6568678678685969',
                        textAlign: TextAlign.start,
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.0,
                            weight: FontWeight.w400)),
                    const SizedBox(
                      height: 35.0,
                    ),
                    tableInvoice(context),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Sub Total',
                                        style: getCustomFont(
                                            color: Colors.black,
                                            size: 12.0,
                                            weight: FontWeight.w500))),
                                Text('\$350',
                                    style: getCustomFont(
                                        color: Colors.black45,
                                        size: 12.0,
                                        weight: FontWeight.w400))
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Grand Total',
                                        style: getCustomFont(
                                            color: Colors.black,
                                            size: 12.0,
                                            weight: FontWeight.w500))),
                                Text('\$350',
                                    style: getCustomFont(
                                        color: Colors.black45,
                                        size: 12.0,
                                        weight: FontWeight.w400))
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text('Due Amount',
                                        style: getCustomFont(
                                            color: Colors.black87,
                                            size: 12.0,
                                            weight: FontWeight.w500))),
                                Text('\$315',
                                    style: getCustomFont(
                                        color: Colors.black45,
                                        size: 12.0,
                                        weight: FontWeight.w400))
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
                            size: 13.5,
                            weight: FontWeight.w500)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text('Three Hundred and fifteen dollars',
                        textAlign: TextAlign.start,
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 12.0,
                            weight: FontWeight.w400)),
                    Text('Thank You for your business.',
                        textAlign: TextAlign.start,
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 12.0,
                            weight: FontWeight.w400)),
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
                    child: Text('S/N',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Medicine Name',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Quantity',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Supplier Price',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Discount',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Purchase Price',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Per Pcs Price',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Total Amount',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.w500,
                            color: Colors.black87)),
                  )
                ]),
              ]),
              TableRow(children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('1',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.normal,
                            color: Colors.black45)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('Ibuprofene',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.normal,
                            color: Colors.black45)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('100',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
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
                            size: 13.0,
                            weight: FontWeight.normal,
                            color: Colors.black45)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('\$0.00',
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
                    child: Text('\$1.01',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.normal,
                            color: Colors.black45)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('0.00',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
                            weight: FontWeight.normal,
                            color: Colors.black45)),
                  )
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Text('\$200.00',
                        maxLines: 1,
                        style: getCustomFont(
                            size: 13.0,
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
