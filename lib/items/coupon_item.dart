import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:merchant/constant/strings.dart';

class CouponItem extends StatelessWidget {
  const CouponItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = BLUECOLOR.withOpacity(.1);
    const Color secondaryColor = BLUECOLOR;

    return CouponCard(
      height: 120.0,
      backgroundColor: primaryColor,
      curveAxis: Axis.vertical,
      firstChild: Container(
        decoration: const BoxDecoration(
          color: secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '23%',
                      style: getCustomFont(
                        color: Colors.white,
                        size: 20.0,
                        weight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'OFF',
                      style: getCustomFont(
                        color: Colors.white,
                        size: 14.0,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white54, height: 0),
            Expanded(
              child: Center(
                child: Text(
                  'WINTER IS\nHERE',
                  textAlign: TextAlign.center,
                  style: getCustomFont(
                    color: Colors.white,
                    size: 11.0,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      secondChild: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coupon Code',
              textAlign: TextAlign.center,
              style: getCustomFont(
                size: 13.0,
                weight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'FREESALES',
              textAlign: TextAlign.center,
              style: getCustomFont(
                size: 24.0,
                color: secondaryColor,
                weight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'Valid Till - 30 Jan 2022',
              textAlign: TextAlign.center,
              style: getCustomFont(
                size: 13.0,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
