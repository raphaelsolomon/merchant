import 'package:merchant/constant/strings.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:merchant/store/product_lists.dart';
import 'package:merchant/store/product_lists_by_brand.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchStores extends StatelessWidget {
  final Function onBack;
  final String type;
  const SearchStores(this.onBack, this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
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
                        onTap: () => Get.back(),
                        child: Icon(Icons.arrow_back_ios,
                            size: 18.0, color: Colors.white)),
                    Text('$type',
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
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                    child: getCardForm('Search Here'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                            padding:
                                const EdgeInsets.only(right: 15.0, left: 15.0),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: returnBrandCrossAxis(
                                        MediaQuery.of(context).size.width),
                                    mainAxisSpacing: 10.0,
                                    mainAxisExtent: 170,
                                    crossAxisSpacing: 10.0),
                            itemCount: 23,
                            itemBuilder: (ctx, i) => GestureDetector(
                                  onTap: () {
                                    if (type == 'Pharmacy Stores') {
                                      Get.to(() => ProductListBrand());
                                    } else {
                                      Get.to(() => ProductList());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        color: Colors.white,
                                        boxShadow: SHADOW),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network('https://media.istockphoto.com/id/1179324818/photo/hospital-building-with-glass-wall-and-mirrored-building.jpg?s=612x612&w=0&k=20&c=6QyyKqIhzhRzwuAKR2rNqIy4G1bETLObbIihtD_xRPk=',
                                                width: 150.0,
                                                height: 110.0,
                                                fit: BoxFit.cover),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Best Care $type',
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: getCustomFont(
                                                    size: 14.0,
                                                    color: Colors.black,
                                                    weight: FontWeight.w400),
                                              ),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                                              decoration: BoxDecoration(
                                                color: Colors.amberAccent.withOpacity(.7),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(100.0),
                                                      bottomLeft: Radius.circular(
                                                          100.0))), child: Text('14% Off', style: getCustomFont(size: 12.0, color: Colors.white),),),
                                        ),
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
          ]),
    );
  }
}
