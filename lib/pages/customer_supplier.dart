import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:provider/provider.dart';

class CustomerAndSupplier extends StatefulWidget {
  final String type;
  const CustomerAndSupplier(this.type, {super.key});

  @override
  State<CustomerAndSupplier> createState() => _CustomerAndSupplierState();
}

class _CustomerAndSupplierState extends State<CustomerAndSupplier> {
  String past = '';

  @override
  void initState() {
    past = widget.type;
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
                  Text('Customers/Suppliers',
                      style: getCustomFont(size: 16.0, color: Colors.white)),
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
                    past = 'Customers';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color:
                          past == 'Customers' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'Customers' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'Customers',
                      style: getCustomFont(
                          size: 13.0,
                          color: past == 'Customers'
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    past = 'Suppliers';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color:
                          past == 'Suppliers' ? BLUECOLOR : Colors.transparent,
                      boxShadow: past == 'Suppliers' ? SHADOW : null),
                  child: FittedBox(
                    child: Text(
                      'Suppliers',
                      style: getCustomFont(
                          size: 13.0,
                          color: past == 'Suppliers'
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 10.0,
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
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 8.0, top: 1.0, bottom: 15.0),
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
                                      past == 'Customers'
                                          ? 'My Customer List'
                                          : 'My Supplier List',
                                      style: getCustomFont(
                                          size: 18.0,
                                          color: Colors.black,
                                          weight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 1.0,
                                    ),
                                    Text(
                                      past == 'Customers'
                                          ? '125 customers'
                                          : '10 Suppliers',
                                      style: getCustomFont(
                                          size: 13.0,
                                          color: Colors.black45,
                                          weight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  var execute = context.read<HomeController>();
                                  if (past == 'Customers') {
                                    if (execute.index.last == -7 || execute.index.last == -5)
                                      execute.setReplaceLast(-5);
                                    else
                                      execute.setPage(-5);
                                  } else {
                                    if (execute.index.last == -7 || execute.index.last == -5)
                                      execute.setReplaceLast(-7);
                                    else
                                      execute.setPage(-7);
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade100,
                                  child: Icon(
                                    Icons.add,
                                    color: BLUECOLOR,
                                    size: 16.0,
                                  ),
                                  radius: 19.0,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 0.0,
                        ),
                        ...List.generate(
                            past == 'Customers' ? 4 : 3,
                            (i) => past == 'Customers'
                                ? customerItem(context)
                                : supplierItem(context)),
                        const SizedBox(
                          height: 50.0,
                        )
                      ],
                    ),
                  )))
        ]));
  }

  Widget customerItem(context) => Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Customer ID - CS0025',
                  style: getCustomFont(
                      color: Colors.black54,
                      size: 12.0,
                      weight: FontWeight.w400),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.location_on, size: 14.0, color: Colors.black),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                      child: Text(
                        'Florida, USA',
                        textAlign: TextAlign.end,
                        style: getCustomFont(
                            color: Colors.black54,
                            size: 12.0,
                            weight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 27.0,
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
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Michelle Fairfax',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 15.0,
                                weight: FontWeight.w400),
                          ),
                        ),
                        Text('\$300.00 CR',
                            style:
                                getCustomFont(size: 12.0, weight: FontWeight.w600, color: Colors.black))
                      ],
                    ),
                    Text(
                      'Phoenixk54@gmail.com',
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 13.0,
                          weight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5.0,
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
                                horizontal: 4.0, vertical: 4.0),
                            child: Icon(
                              Icons.phone,
                              size: 14.0,
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
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ));

  Widget supplierItem(context) => Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Supplier ID - S0025',
                  style: getCustomFont(
                      color: Colors.black54,
                      size: 12.0,
                      weight: FontWeight.w400),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.location_on, size: 14.0, color: Colors.black),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                      child: Text(
                        'Florida, USA',
                        textAlign: TextAlign.end,
                        style: getCustomFont(
                            color: Colors.black54,
                            size: 12.0,
                            weight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 27.0,
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
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Michelle Fairfax',
                            style: getCustomFont(
                                color: Colors.black,
                                size: 15.0,
                                weight: FontWeight.w400),
                          ),
                        ),
                        Text('\$300.00 CR',
                            style:
                                getCustomFont(size: 12.0, color: Colors.black, weight: FontWeight.w600),)
                      ],
                    ),
                    Text(
                      'Phoenixk54@gmail.com',
                      style: getCustomFont(
                          color: Colors.black54,
                          size: 13.0,
                          weight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5.0,
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
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ));
}
