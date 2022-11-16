import 'package:merchant/constant/strings.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/store/product_lists_by_brand.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ByBrand extends StatelessWidget {
  final Function onBack;
  const ByBrand(this.onBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => onBack(),
                            child: Icon(Icons.arrow_back_ios,
                                size: 19.0, color: Colors.black)),
                        const SizedBox(width: 10.0),
                        Image.asset('assets/imgs/logo.png',
                            width: 150.0, fit: BoxFit.contain),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        null,
                        size: 19.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Featured Brand',
                style: getCustomFont(
                    size: 15.0, color: Colors.black, weight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: getCardForm('Search Brands'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: returnBrandCrossAxis(
                                          MediaQuery.of(context).size.width),
                                      mainAxisSpacing: 15.0,
                                      mainAxisExtent: 140,
                                      crossAxisSpacing: 20.0),
                              itemCount: 23,
                              itemBuilder: (ctx, i) => GestureDetector(
                                onTap: () => Get.to(() => ProductListBrand()),
                                child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                          color: Colors.white,
                                          boxShadow: SHADOW),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Center(
                                            child: Image.asset(
                                                'assets/imgs/pills.png',
                                                width: 150.0,
                                                fit: BoxFit.contain),
                                          )),
                                          Text(
                                            'Peak',
                                            style: getCustomFont(
                                                size: 14.0, color: Colors.black, weight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                              )),
                          const SizedBox(
                            height: 80.0,
                          )
                        ],
                      ),
                    ))
                  ]))
            ]));
  }
}
