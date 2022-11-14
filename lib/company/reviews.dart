import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
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
                      onTap: () => context.read<HomeController>().onBackPress(),
                      child: Icon(Icons.arrow_back_ios,
                          size: 18.0, color: Colors.white)),
                 
                  Text('Reviews',
                      style:
                          getCustomFont(size: 16.0, color: Colors.white)),
                  InkWell(
                    onTap: () {
                      context.read<HomeController>().setPage(-22);
                    },
                    child: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
               const SizedBox(
            height: 15.0,
          ),
            ]),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) => getReviews(context)))
        ]));
  }

 Widget getReviews(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(bottom: 7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: SHADOW,
        ),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/imgs/1.png'),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Richard Wilson',
                        style: getCustomFont(
                          size: 17.0,
                          color: Colors.black,
                          weight: FontWeight.w500,
                        )),
                    Text('Reviewed 2 days ago',
                        style: getCustomFont(
                          size: 13.0,
                          color: Colors.black54,
                          weight: FontWeight.normal,
                        )),
                    const SizedBox(
                      height: 3.0,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15.0,
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
                    const SizedBox(height: 7.0),
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          color: Color(0xFF00CC80),
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: Text('I recommend the doctor',
                              style: getCustomFont(
                                size: 13.0,
                                color: Color(0xFF00CC80),
                                weight: FontWeight.normal,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7.0),
                    Text('$DUMMYREVIEW',
                        style: getCustomFont(
                          size: 13.0,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                    const SizedBox(height: 10.0),
                    DottedBorder(
                        color: Colors.black45,
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                        )),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: Colors.lightBlueAccent,
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: Text('Reply',
                              style: getCustomFont(
                                size: 13.0,
                                color: Colors.lightBlueAccent,
                                weight: FontWeight.normal,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text('Recommend?',
                            style: getCustomFont(
                              size: 13.0,
                              color: Colors.black,
                              weight: FontWeight.normal,
                            )),
                        const SizedBox(
                          width: 15.0,
                        ),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(100.0),
                          padding: EdgeInsets.all(5.0),
                          dashPattern: [8, 4],
                          strokeCap: StrokeCap.butt,
                          color: Colors.black,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_outlined,
                                  color: Colors.black,
                                  size: 16.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text('Yes',
                                    style: getCustomFont(
                                      size: 13.0,
                                      color: Colors.black,
                                      weight: FontWeight.normal,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(100.0),
                          padding: EdgeInsets.all(5.0),
                          dashPattern: [8, 4],
                          strokeCap: StrokeCap.butt,
                          color: Colors.black,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_down_outlined,
                                  color: Colors.black,
                                  size: 16.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text('No',
                                    style: getCustomFont(
                                      size: 13.0,
                                      color: Colors.black,
                                      weight: FontWeight.normal,
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(child: TextFormField(
                    
                        )),
                        const SizedBox(width: 25.0,),
                        Transform.rotate(
                          angle: 5.9,
                          child: Icon(Icons.send, color: BLUECOLOR.withOpacity(.7), size: 30.0,))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      );
}
