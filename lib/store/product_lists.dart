import 'package:merchant/constant/strings.dart';
import 'package:merchant/store/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: BLUECOLOR,
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 19.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Product List',
                      style: GoogleFonts.poppins(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      null,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              Expanded(
                  child: Container(
                    width: width,
                    height: MediaQuery.of(context).size.width,
                    color: Color(0xFFF6F6F6),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: returnCrossAxis(width),
                                  mainAxisSpacing: 10.0,
                                  mainAxisExtent: 210.0,
                                  crossAxisSpacing: 10.0),
                              itemCount: 10,
                              itemBuilder: (ctx, i) => GestureDetector(
                                onTap: () => Get.to(() => ProductDetails()),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: SHADOW,
                                      color: Colors.white),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Expanded(child: Center(
                                              child: Image.asset(
                                                'assets/imgs/pills.png'
                                              ),
                                            )),
                                            const SizedBox(
                                              height: 2.0,
                                            ),
                                            Text(
                                              'Salospir 200mg Tablet',
                                              textAlign: TextAlign.start,
                                              style: getCustomFont(
                                                  size: 14.0, color: Colors.black45),
                                            ),
                                            const SizedBox(
                                              height: 3.0,
                                            ),
                                            Text(
                                              '\$5.50',
                                              style: getCustomFont(
                                                  size: 15.0,
                                                  color: Colors.black,
                                                  weight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          width: 30.0,
                                          height: 35.0,
                                          decoration: BoxDecoration(
                                              color: BLUECOLOR,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15.0),
                                                  bottomRight:
                                                  Radius.circular(15.0))),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 19.0,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }

  int returnCrossAxis(width) {
    return width < 500
        ? 2
        : width > 500 && width < 100
        ? 2
        : 3;
  }
}
