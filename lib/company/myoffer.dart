import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/add_coupon.dart';
import 'package:merchant/items/coupon_item.dart';
import 'package:merchant/dialog/subscribe.dart';
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
                      Text('My Offers/Coupons',
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
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 0.0),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (ctx, i) => myOffers(context)))
            ]),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: FloatingActionButton.extended(
                  label: Text('Add Coupon'),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showRequestSheet(context, AddCoupon());
                  },
                  backgroundColor: BLUECOLOR,
                ),
              ),
            ),
          ],
        ));
  }

  Widget myOffers(context) => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        child: CouponItem()
      );
}
