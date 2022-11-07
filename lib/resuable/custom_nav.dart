import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/store/index.dart';
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
            getNavItems(FontAwesome5.user_nurse, 'Doctors', () {
              readExec.setPage(-16);
              if (readExec.isEstoreClicked) {
                readExec.isEstore(false);
                Navigator.pop(context);
              }
            }, counter.last == -16 && !readExec.isEstoreClicked),
            getNavItems(Icons.store, 'E-Stores', () {
              if (readExec.isEstoreClicked) {
                readExec.setStoreIndex(0);
                return;
              }
              readExec.isEstore(true);
              Get.to(() => StorePage(0));
            }, readExec.isEstoreClicked && readExec.storeIndex == 0),
            getNavItems(Icons.receipt_long_outlined, 'Hospitals', () {
              if (readExec.isEstoreClicked) {
                readExec.setStoreIndex(2);
                return;
              }
              readExec.isEstore(true);
              Get.to(() => StorePage(2));
            }, readExec.isEstoreClicked && readExec.storeIndex == 2),
            getNavItems(Icons.more, 'More', () {
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
                                getNavItems(
                                    Icons.local_pharmacy_outlined, 'Pharmacy',
                                    () {
                                  if (readExec.isEstoreClicked) {
                                    readExec.setStoreIndex(3);
                                    Navigator.pop(context);
                                    return;
                                  }
                                  readExec.isEstore(true);
                                  Navigator.pop(context);
                                  Get.to(() => StorePage(3));
                                },
                                    readExec.isEstoreClicked &&
                                        readExec.storeIndex == 3),
                                Divider(),
                                getNavItems(Icons.receipt_rounded, 'Order', () {
                                  Navigator.pop(context);
                                 // Get.to(() => RecentOrder());
                                }, false),
                                Divider(),
                                getNavItems(Icons.person, 'Account', () {
                                  readExec.setPage(-19);
                                   Navigator.pop(context);
                                  if (readExec.isEstoreClicked) {
                                    readExec.isEstore(false);
                                    Get.back();
                                  }
                                }, counter.last == -19 && !readExec.isEstoreClicked)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            }, counter.last == 2),
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
