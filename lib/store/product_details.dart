import 'package:merchant/constant/strings.dart';
import 'package:merchant/store/my_cart.dart';
import 'package:merchant/store/product_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: BLUECOLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 45.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
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
                  'Product Details',
                  style: GoogleFonts.poppins(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => MyCart());
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFF6F6F6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    padding: const EdgeInsets.all(15.0),
                    height: 370.0,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(child: Image.network('https://www.gannett-cdn.com/-mm-/8c07fb5e886a00b62f067b40a655ac7eab58b994/c=0-62-3450-2008/local/-/media/Nashville/Nashville/2014/06/04//1401930981000-pills.jpg')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Flexible(child: Text('Silospir 100mg Tablet', style: getCustomFont(size: 16.0, color: Colors.black, weight: FontWeight.w500),)),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 19.0,),
                              Text('4.5', style: getCustomFont(size: 15.0, color: Colors.amber, weight: FontWeight.w500),),
                            ],
                          ),
                        ],),
                        const SizedBox(height: 3.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text('Health Care', style: getCustomFont(size: 14.0, color: Colors.black45, weight: FontWeight.w500),)),
                            Flexible(child: GestureDetector(
                                onTap: () => Get.to(() => ProductReview()),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Text('Read all 125 reviews', style: getCustomFont(size: 14.0, color: Colors.black45, weight: FontWeight.w500),)),
                                    Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 17.0)
                                  ],
                                ))),
                          ],)
                      ],
                    ),
                  ),
                   const SizedBox(height: 5.0,),
                  Container(
                    width: width,
                    color: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('description', style: getCustomFont(size: 15.0, color: Colors.black45, weight: FontWeight.w500),),
                        const SizedBox(height: 2.0,),
                        Text(DUMMYTEXT, style: getCustomFont(size: 13.0, color: Colors.black, weight: FontWeight.normal),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Container(
                    width: width,
                    color: Colors.white,
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sold By', style: getCustomFont(size: 15.0, color: Colors.black45, weight: FontWeight.w500),),
                        const SizedBox(height: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: thirdScroll(context)),
                            Flexible(child: FittedBox(child: Text('view profile >', style: getCustomFont(size: 13.0, color: Colors.black45),)))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$3.50', style: getCustomFont(size: 16.0, color: Colors.black, weight: FontWeight.bold),),
                Text('packs of 8', style: getCustomFont(size:13.0, color: Colors.black45, weight: FontWeight.normal),),
              ],
            ),
          ),
          Container(
            width: width,
            height: 50.0,
            color: BLUECOLOR,
            child: Center(child: Text('Add to cart', style: getCustomFont(size: 16.0, color: Colors.white),)),
          )
        ],
      ),
    );
  }
  Widget thirdScroll(context) => GestureDetector(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1179324818/photo/hospital-building-with-glass-wall-and-mirrored-building.jpg?s=612x612&w=0&k=20&c=6QyyKqIhzhRzwuAKR2rNqIy4G1bETLObbIihtD_xRPk='), fit: BoxFit.cover),
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 10.0,),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: Text('Well Life Store', style: getCustomFont(color: Colors.black, size:14.0, weight: FontWeight.w500),)),
              const SizedBox(height: 1.0,),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black45, size: 12.0,),
                  const SizedBox(width: 5.0,),
                  Flexible(child: FittedBox(child: Text('Willington Bridge', style: getCustomFont(color: Colors.black45, size:12.0, weight: FontWeight.normal),))),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
