import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAndSub extends StatelessWidget {
  const CategoriesAndSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFf6f6f6),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: BLUECOLOR,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 19.0,
                                )),
                            Text('Shop By Category',
                                style: getCustomFont(
                                    size: 17.0, color: Colors.white)),
                            Icon(
                              null,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Row(
                children: [
                  const SizedBox(
                    width: 15.0,
                  ),
                  Flexible(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...List.generate(7, (i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13.0),
                          child: Column(
                              children: [
                                Image.asset('assets/imgs/female.png', width: 50.0, height: 50.0, fit: BoxFit.contain),
                                const SizedBox(height: 5.0,),
                                FittedBox(
                                  child: Text(
                                    'Antibiotics',
                                    style: getCustomFont(
                                        color: Colors.black54,
                                        weight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                        ),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 13.0,
                  ),
                  Flexible(
                      flex: 4,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: Colors.transparent), child: GridView.builder(
                                padding: const EdgeInsets.all(0.0),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 199.0,
                                crossAxisCount: returnCrossAxis(MediaQuery.of(context).size.width),
                                childAspectRatio: 2.0,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ), itemBuilder: (ctx, i) => Container(
                                margin: const EdgeInsets.all(5.0),
                                 padding: const EdgeInsets.all(15.0),
                                width: MediaQuery.of(ctx).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: Colors.white
                                ),
                                child: Column(children: [
                                  const SizedBox(height: 7.0,),
                                  Image.asset('assets/imgs/pills.png', width: 70.0, height: 70.0, fit: BoxFit.contain),
                                   const SizedBox(height: 7.0,),
                                   FittedBox(child: Text('Sport Nutrition', style: getCustomFont(size: 13.0, color: Colors.black, weight: FontWeight.w600),)),
                                   const SizedBox(height: 7.0,),
                                   Row(
                                     children: [
                                       Text('\$ 25.00', style: getCustomFont(size: 13.0, color: Colors.black45, weight: FontWeight.w400),),
                                       const SizedBox(width: 10.0,),
                                       Flexible(child: Container(
                                        decoration: BoxDecoration(color: Colors.redAccent),
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                                        child: FittedBox(child: Text('20% OFF', style: getCustomFont(size: 11.0, color: Colors.white))),
                                       ),)
                                     ],
                                   ),
                                    const SizedBox(height: 3.0,),
                                   SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('\$ 30.0', style: getCustomFont(size: 14.0, color: Colors.black, weight: FontWeight.w600),)),
                                ]),
                              )),)),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ))
            ])));
  }

  int returnCrossAxis(width) {
    return width < 500
        ? 2 : width > 500 && width < 100
            ? 2 : 3;
  }
}
