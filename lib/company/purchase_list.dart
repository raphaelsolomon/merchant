import 'package:intl/intl.dart';
import 'package:merchant/company/purchase_invoice.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/add_purchase.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseList extends StatefulWidget {
  const PurchaseList({Key? key}) : super(key: key);

  @override
  State<PurchaseList> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Stack(
          children: [
            Column(children: [
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
                          onTap: () =>
                              context.read<HomeController>().onBackPress(),
                          child: Icon(Icons.arrow_back_ios,
                              size: 18.0, color: Colors.white)),
                      Text('Purchase List',
                          style:
                              getCustomFont(size: 16.0, color: Colors.white)),
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
                height: 0.0,
              ),
              Expanded(child: tableHeader([1, 2]))
            ]),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: FloatingActionButton.extended(
                  label: Text('Add Purchase'),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () =>
                      showRequestSheet(context, AddPurchase(false)),
                  backgroundColor: BLUECOLOR,
                ),
              ),
            ),
          ],
        ));
  }

  Widget tableHeader(List item) => SingleChildScrollView(
          child: Column(children: [
        SingleChildScrollView(
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
                                size: 15.0,
                                weight: FontWeight.bold,
                                color: Colors.black)),
                      )
                    ]),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Text('Pur.Date',
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
                        child: Text('Exp. Date',
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
                        child: Text('Pur. ID',
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
                        child: Text('Batch ID',
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
                        child: Text('Invoice No.',
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
                        child: Text('Med. Codes',
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
                        child: Text('Bar/QR Code',
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
                        child: Text('Brands',
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
                        child: Text('Supplier',
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
                        child: Text('Category',
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
                        child: Text('Sub. Category',
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
                        child: Text('Med. Qty',
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
                        child: Text('Box Pattern',
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
                        child: Text('Box Qty',
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
                        child: Text('Purchase Price',
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
                        child: Text('Selling Price',
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
                        child: Text('Discount',
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
                        child: Text('Tax',
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
                        child: Text('Amount',
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
                  ...item.map((e) => tableChild(e)).toList()
                ],
              ),
            ],
          ),
        ),
      ]));

  tableChild(e) => TableRow(children: [
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('1',
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('2020-02-02'))}',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('2020-02-02'))}',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('345454',
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('B12131',
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('INV342777234',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('MED3562',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('',
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('Emzor',
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('May & Bakers Ltd',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('profine',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('profine',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('500mg',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('Silver Leaf',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('28 packs',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('\$199.0',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('\$299.0',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('10%',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
                '\$299.0',
                maxLines: 1,
                style: getCustomFont(
                    size: 13.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () => showRequestSheet(context, PurchaseInvoiceReceipt()),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(.9),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 15.0,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () => null,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            color: BLUECOLOR.withOpacity(.9),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 15.0,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () => null,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.red.withOpacity(.9),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 15.0,
                        )),
                  ),
                ),
              ],
            ),
          )
        ]),
      ]);
}
