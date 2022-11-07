import 'package:flutter/material.dart';
import 'package:merchant/constant/strings.dart';

class SelectDays extends StatelessWidget {
  const SelectDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0))),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(height: 10.0,),
              Text('Select Days', style: getCustomFont(size: 16.0, color: Colors.black, weight: FontWeight.w600),),
              const SizedBox(height: 10.0,),
              Row(
                children: [

                ],
              )
            ]));
  }
}
