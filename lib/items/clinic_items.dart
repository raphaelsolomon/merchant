

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/store/hospital_details.dart';
import 'package:merchant/store/product_lists_by_brand.dart';

class ClinicItems extends StatelessWidget {
  const ClinicItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15.0),
      decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(0.0, 1.0))
        ], color: Colors.white, borderRadius: BorderRadius.circular(13.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/imgs/4.png', width: 70.0, height: 70.0, fit: BoxFit.fill,),
          ),
          const SizedBox(width: 10.0,),
          Flexible(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            FittedBox(child: Text('Medilife Medical Center', style: getCustomFont(size: 16.0, color: Colors.lightBlue.shade300, weight: FontWeight.w600))),
            Row(children: [
              Container(
                decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(3.0)),
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
                child: Text('3.0', style: getCustomFont(size: 9.0, color: Colors.white, weight: FontWeight.bold))),
                const SizedBox(width: 10.0,),
              Flexible(
                child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15.0,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
              ),Text('(17)', style: getCustomFont(size: 13.0, color: Colors.black87),)
            ],),
            const SizedBox(height: 10.0),
            Row(children: [
              Icon(Icons.phone, color: Colors.black45, size: 14.0),
              const SizedBox(width: 10.0,),
              Flexible(child: FittedBox(child: Text('288-312-7823', style: getCustomFont(size: 11.0, color: Colors.black45, weight: FontWeight.w400))),)
            ]),
            const SizedBox(height: 2.0),
            Row(children: [
              Icon(Icons.location_on, color: Colors.black45, size: 14.0),
              const SizedBox(width: 10.0,),
              Flexible(child: FittedBox(child: Text('3849 Nutter Street FerrelView, MO 64163', style: getCustomFont(size: 11.0, color: Colors.black45, weight: FontWeight.w400))),)
            ]),
             const SizedBox(height: 2.0),
            Row(children: [
              Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 14.0),
              const SizedBox(width: 10.0,),
              Flexible(child: FittedBox(child: Text('Chemists, Surgical Equipment Dealer', style: getCustomFont(size: 11.0, color: Colors.black45, weight: FontWeight.w400))),)
            ]),
            const SizedBox(height: 2.0),
            Row(children: [
              Icon(Icons.timer, color: Colors.black45, size: 14.0),
              const SizedBox(width: 10.0,),
              Flexible(child: FittedBox(child: Text('Opens at 09:00 AM', style: getCustomFont(size: 11.0, color: Colors.black45, weight: FontWeight.w400))),)
            ]),
            const SizedBox(height: 18.0,),
            Row(children: [
              Flexible(child: detailsButton(context, (){
                Get.to(() => HospitalDetails());
              })),
              const SizedBox(width: 10.0),
              Flexible(child: browseButton(context, (){
                Get.to(() => ProductListBrand());
              }))
            ],)
          ],crossAxisAlignment: CrossAxisAlignment.start,))
        ],
      ),
    );
  }


  Widget detailsButton(context, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2.0, color: BLUECOLOR),
              borderRadius: BorderRadius.circular(100.0)),
          child: Center(
            child: Text(
              'Details',
              style: getCustomFont(
                  size: 13.0,
                  color: BLUECOLOR,
                  weight: FontWeight.normal),
            ),
          ),
        ),
      );

      Widget browseButton(context, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
           width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
          decoration: BoxDecoration(
              color: BLUECOLOR,
              border: Border.all(width: 2.0, color: BLUECOLOR),
              borderRadius: BorderRadius.circular(100.0)),
          child: Center(
            child: Text(
              'Products',
              style: getCustomFont(
                  size: 13.0,
                  color: Colors.white,
                  weight: FontWeight.normal),
            ),
          ),
        ),
      );
}