import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:merchant/constant/strings.dart';

class StoreNav extends StatelessWidget {
  final BuildContext c;
  final Function callBack;
  final int counter;
  const StoreNav(this.c, this.callBack, this.counter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100.0)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getNavItems(FontAwesome5.pills, 'E-Stores', () =>  callBack(0), counter == 0),
            getNavItems(FontAwesome5.user_nurse, 'Doctors', () => callBack(1), counter == 1),
            getNavItems(Icons.add_location_alt, 'Hospitals', () => callBack(2), counter == 2),
            getNavItems(Icons.shopping_basket_outlined, 'Pharmacy', () => callBack(3), counter == 3),
            getNavItems(Icons.person_outline, 'Profile', () => callBack(4), counter == 4),
          ],
        ),
      ),
    );
  }

  getNavItems(icon, text, cB, b) {
    return InkWell(
      onTap: () => cB(),
      child: Column(
        children: [
          FaIcon(
            icon,
            size: 21.0,
            color: b? BLUECOLOR : Colors.black,
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            '$text',
            style:
                getCustomFont(size: 10.0, color: b ? BLUECOLOR : Colors.black),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Icon(
            Icons.circle,
            size: 8.0,
            color: b ? BLUECOLOR : Colors.transparent,
          )
        ],
      ),
    );
  }
}
