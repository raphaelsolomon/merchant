import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/model/cart_model.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/store/delivery_location.dart';
import 'package:merchant/store/prescription_upload.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int page = 0;
  bool isCoupon = false;
  List<CartModel> cartModel = [
    CartModel(
        itemName: 'Silispor 100mg Tablet',
        price: 3.50,
        desc: 'pack of 100mg',
        quantity: 1),
    CartModel(
        itemName: 'Silispor 200mg Tablet',
        price: 3.50,
        desc: 'pack of 200mg',
        quantity: 1),
    CartModel(
        itemName: 'Silispor 300mg Tablet',
        price: 3.50,
        desc: 'pack of 300mg',
        quantity: 1),
    CartModel(
        itemName: 'Silispor 400mg Tablet',
        price: 3.50,
        desc: 'pack of 400mg',
        quantity: 1),
    CartModel(
        itemName: 'Silispor 500mg Tablet',
        price: 3.50,
        desc: 'pack of 500mg',
        quantity: 1),
  ];

  double total = 0.0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      dialogMessage(
          context,
          prescriptionRequire(context, callBack: () {
            setState(() {
              page = 1;
            });
          }),
          barrierDismiss: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
          body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFf6f6f6),
              child: page == 0
                  ? myCartIndex
                  : page == 1
                      ? PrescriptionUpload(() {
                          setState(() {
                            page = 0;
                          });
                        })
                      : getPaymentWidget(context))),
    );
  }

  Future<bool> onBackPress() async {
    if (page > 0) {
      setState(() {
        page = 0;
      });
      return false;
    }
    return true;
  }

  getPaymentWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
            width: MediaQuery.of(context).size.width,
            height: 89.0,
            color: BLUECOLOR,
            child: Column(children: [
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          page = 0;
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20.0,
                      )),
                  Text('Payment Method',
                      style: getCustomFont(size: 18.0, color: Colors.white)),
                  Icon(
                    null,
                    color: Colors.white,
                  )
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 11.0),
                  decoration: BoxDecoration(
                      color: BLUECOLOR,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Amount to pay ',
                          style:
                              getCustomFont(color: Colors.white, size: 13.0)),
                      Text('\$31.0 ',
                          style: getCustomFont(
                              color: Colors.white,
                              size: 15.0,
                              weight: FontWeight.w700)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  dashPattern: [8, 4],
                  strokeCap: StrokeCap.butt,
                  color: Colors.black,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Icon(Icons.wallet_giftcard,
                                  color: Colors.lightBlue),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text('Wallet ',
                                  style: getCustomFont(
                                      color: Colors.black,
                                      size: 16.0,
                                      weight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialogMessage(context, walletTop(context));
                          },
                          child: Text('\$314.50 ',
                              style: getCustomFont(
                                  color: Colors.black,
                                  size: 15.0,
                                  weight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Cards',
                  style: getCustomFont(
                      weight: FontWeight.bold,
                      size: 20.0,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                // items(Icons.credit_card, 'Debit Card'),
                // Divider(),
                items(FontAwesome5.credit_card, 'Credit Card'),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Cash',
                  style: getCustomFont(
                      weight: FontWeight.bold,
                      size: 20.0,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                items(Icons.money, 'Cash on Delivery'),
                Divider(),
                items(FontAwesome5.cash_register, 'Pay cash on spot'),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Bank',
                  style: getCustomFont(
                      weight: FontWeight.bold,
                      size: 20.0,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                items(Icons.money, 'USSD'),
                Divider(),
                items(FontAwesome5.cash_register, 'Cheque Payment'),
                Divider(),
                items(Icons.money, 'Bank Transfer'),
                Divider(),
                items(FontAwesome5.cash_register, 'Net Banking'),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Others',
                  style: getCustomFont(
                      weight: FontWeight.bold,
                      size: 20.0,
                      color: Colors.black45),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                items(FontAwesome5.amazon_pay, 'Paystack'),
                Divider(),
                items(FontAwesome5.amazon_pay, 'Razor Pay'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget items(icon, text) => Row(
        children: [
          Flexible(
            child: Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(
                  width: 15.0,
                ),
                Flexible(
                  child: Text('$text',
                      style: getCustomFont(
                          color: Colors.black,
                          size: 14.0,
                          weight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 10.0,
              width: 10.0,
              child: Radio(onChanged: (b) {}, value: false, groupValue: true)),
          const SizedBox(
            width: 20.0,
          )
        ],
      );

  Widget prescriptionUpload() => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(children: [
        Flexible(child: Text('prescription Uploaded', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.w500,))),
        Icon(Icons.remove_red_eye_sharp, color: BLUECOLOR, size: 18.0,),
        const SizedBox(width: 20.0,),
        Icon(Icons.delete, color: Colors.redAccent, size: 18.0,),
      ]));

  Widget get myCartIndex => Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: BLUECOLOR,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 19.0,
                          )),
                      Text('Cart',
                          style:
                              getCustomFont(size: 17.0, color: Colors.white)),
                      Icon(
                        null,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ]),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: cartModel.length,
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  cartModel.forEach((element) {
                    total += element.total;
                  });
                  return getCartItem(cartModel[i]);
                })),
        const SizedBox(height: 8.0),
        Container(
          color: Colors.white,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCoupon = true;
                      });
                    },
                    child: Text(
                      'Apply a coupon code',
                      style: getCustomFont(
                          color: Colors.lightBlueAccent,
                          size: 14.0,
                          weight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  isCoupon ? getCouponCode(context, ctl: null) : SizedBox(),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub Total',
                        style: getCustomFont(
                            color: Colors.black,
                            size: 13.5,
                            weight: FontWeight.w400),
                      ),
                      Text(
                        '\$16.0',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.5,
                            weight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Promo Code Applied',
                        style: getCustomFont(
                            color: Colors.black,
                            size: 13.5,
                            weight: FontWeight.w400),
                      ),
                      Text(
                        '-\$16.0',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.5,
                            weight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service Charge',
                        style: getCustomFont(
                            color: Colors.black,
                            size: 13.5,
                            weight: FontWeight.w400),
                      ),
                      Text(
                        '\$4.0',
                        style: getCustomFont(
                            color: Colors.black45,
                            size: 13.5,
                            weight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount to pay',
                        style: getCustomFont(
                            color: Colors.black,
                            size: 15.0,
                            weight: FontWeight.bold),
                      ),
                      Text(
                        '\$${total}',
                        style: getCustomFont(
                            color: BLUECOLOR,
                            size: 14.0,
                            weight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
            GestureDetector(
              // onTap: () {
              //   setState(() {
              //     page = 2;
              //   });
              // },
              onTap: () {
                Get.to(() => DeliveryLocation());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45.0,
                color: BLUECOLOR,
                child: Center(
                  child: Text(
                    'Checkout',
                    style: getCustomFont(size: 14.0, color: Colors.white),
                  ),
                ),
              ),
            )
          ]),
        )
      ]);

  Widget getCartItem(CartModel cartModel) => Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage('assets/imgs/1.png'),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartModel.itemName!,
                  style: getCustomFont(
                      size: 14.0, color: Colors.black, weight: FontWeight.w500),
                ),
                Text(
                  cartModel.desc!,
                  style: getCustomFont(
                      size: 13.0,
                      color: Colors.black45,
                      weight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() {
                              cartModel.reduceQuantity();
                            }),
                            child: Icon(
                              FontAwesome5.minus,
                              color: BLUECOLOR,
                              size: 12.0,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '${cartModel.quantity}',
                            style: getCustomFont(
                                size: 14.0,
                                color: Colors.black,
                                weight: FontWeight.w400),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              cartModel.addQuantity();
                            }),
                            child: Icon(
                              FontAwesome5.plus,
                              color: BLUECOLOR,
                              size: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$3.50',
                      style: getCustomFont(
                          size: 14.0,
                          color: BLUECOLOR,
                          weight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ));
}
