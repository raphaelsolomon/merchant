import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/pages/scan.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatefulWidget {
  final BuildContext c;
  final int pageIndex = 0;
  const CustomNavBar(this.c, {pageIndex, Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  bool isMore = false;

  @override
  Widget build(BuildContext context) {
    var counter = context.watch<HomeController>().index;
    var readExec = context.watch<HomeController>();
    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
          boxShadow: SHADOW,
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getNavItems(Icons.house_outlined, 'Home', () {
              readExec.jumpToHome();
              if (readExec.isEstoreClicked) {
                readExec.isEstore(false);
                Navigator.pop(context);
              }
            }, counter.last == 0 && !readExec.isEstoreClicked),
            getNavItems(Icons.storefront, 'My Store', () {
              readExec.setPage(2);
              if (readExec.isEstoreClicked) {
                readExec.isEstore(false);
                Navigator.pop(context);
              }
            }, counter.last == 2 && !readExec.isEstoreClicked),
            getNavItems(Icons.qr_code, 'Scan', () {
              Get.to(() => ScanPage());
            }, false),
            getNavItems(Icons.people, 'Customers', () {
              readExec.setPage(5);
              if (readExec.isEstoreClicked) {
                readExec.isEstore(false);
                Navigator.pop(context);
              }
            }, counter.last == 5 && !readExec.isEstoreClicked),
            getNavItems(Icons.more_horiz, 'More', () {
              dialogMessage(
                  context,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16.0, right: 16.0, left: 16.0, bottom: 10.0),
                      child: Material(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, right: 16.0, left: 16.0, bottom: 16.0),
                          child: SizedBox(
                            width: 35.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                getNavItems( Icons.local_pharmacy_outlined, 'Profile', () {
                                  readExec.setPage(6);
                                  Navigator.pop(context);
                                  if (readExec.isEstoreClicked) {
                                    readExec.isEstore(false);
                                    Navigator.pop(context);
                                  }
                                },counter.last == 6 && !readExec.isEstoreClicked),
                                Divider(),
                                getNavItems(Icons.person, 'Account', () {
                                  readExec.setPage(8);
                                  Navigator.pop(context);
                                  if (readExec.isEstoreClicked) {
                                      readExec.isEstore(false);
                                      Navigator.pop(context);
                                    }
                                  },counter.last == 8 &&  !readExec.isEstoreClicked),
                                Divider(),
                                getNavItems(Icons.receipt_rounded, 'My Loan', () {
                                  readExec.setPage(18);
                                  Navigator.pop(context);
                                  if (readExec.isEstoreClicked) {
                                    readExec.isEstore(false);
                                    Navigator.pop(context);
                                  }
                                },counter.last == 18 && !readExec.isEstoreClicked),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            }, counter.last == 6 || counter.last == 8 || counter.last == 18),
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
            color: b ? BLUECOLOR : Colors.black,
          ),
          const SizedBox(
            height: 2.0,
          ),
          FittedBox(
            child: Text(
              '$text',
              style: getCustomFont(
                  size: 10.0, color: b ? BLUECOLOR : Colors.black),
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          b
              ? Icon(
                  Icons.circle,
                  size: 8.0,
                  color: b ? BLUECOLOR : Colors.transparent,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
