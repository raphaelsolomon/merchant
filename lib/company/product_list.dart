import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOffer extends StatelessWidget {
  const MyOffer({Key? key}) : super(key: key);

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
                      Text('product List',
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
                height: 15.0,
              ),
              Expanded(child: tableHeader([]))
            ]),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: FloatingActionButton.extended(
                  label: Text('Add Product'),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {},
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
                        child: Text('#',
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
                        child: Text('Name',
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
                        child: Text('BMI',
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
                        child: Text('Heart Rate',
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
                        child: Text('FBC Status',
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
                        child: Text('Weight',
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
                        child: Text('Order Date',
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
            child: Text('${e['id']}',
                style: getCustomFont(
                    size: 15.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${e['name']}',
                style: getCustomFont(
                    size: 15.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${e['bmi']}',
                maxLines: 1,
                style: getCustomFont(
                    size: 15.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${e['heart_rate']}',
                maxLines: 1,
                style: getCustomFont(
                    size: 15.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${e['fbc_status']}',
                maxLines: 1,
                style: getCustomFont(
                    size: 15.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text('${e['weight']}Kg',
                maxLines: 1,
                style: getCustomFont(
                    size: 15.0,
                    weight: FontWeight.normal,
                    color: Colors.black45)),
          )
        ]),
        Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Text(
                '${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse('${e['order_date']}'))}',
                maxLines: 1,
                style: getCustomFont(
                    size: 15.0,
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
                    onTap: () => null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: BLUECOLOR.withOpacity(.9),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Text('Edit',
                          maxLines: 1,
                          style: getCustomFont(
                              size: 15.0,
                              weight: FontWeight.normal,
                              color: Colors.white)),
                    ),
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
                          horizontal: 10.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.9),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Text('Del',
                          maxLines: 1,
                          style: getCustomFont(
                              size: 15.0,
                              weight: FontWeight.normal,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ]);
}
