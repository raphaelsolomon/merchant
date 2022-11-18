import 'package:merchant/constant/strings.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({Key? key}) : super(key: key);

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
                      onTap: () =>
                          context.read<HomeController>().onBackPress(),
                      child: Icon(Icons.arrow_back_ios,
                          size: 18.0, color: Colors.white)),
                 
                  Text('Share The Love',
                      style:
                          getCustomFont(size: 15.0, color: Colors.white)),
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
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    'assets/auth/1.jpeg',
                    width: 200,
                    height: 200.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Share the app link to friends, colleges, and family members and get a 2% cash on their purchase!',
                    textAlign: TextAlign.center,
                    style: getCustomFont(
                        size: 15.0,
                        color: Colors.black87,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Share you code:',
                    textAlign: TextAlign.center,
                    style: getCustomFont(
                        size: 13.0,
                        color: Colors.black45,
                        weight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: BLUECOLOR.withOpacity(.05),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'whoWIH',
                          style: getCustomFont(size: 16.0, color: BLUECOLOR),
                        ),
                        Icon(
                          Icons.link,
                          color: BLUECOLOR,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Share your friend by using any of the platform',
                    textAlign: TextAlign.center,
                    style: getCustomFont(
                        size: 18.0,
                        color: Colors.black87,
                        weight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      social(Icons.facebook, BLUECOLOR),
                      social(FontAwesome.twitter, Colors.lightBlueAccent),
                      social(
                          FontAwesome.google_plus_circle, Colors.red.shade300),
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      social(Icons.wechat, Colors.green),
                      social(FontAwesome.whatsapp, Colors.green),
                      social(FontAwesome.mail, Colors.purple),
                    ],
                  )
                ],
              ),
            ),
          ))
        ]));
  }

  social(icon, color) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(100.0)),
      child: Icon(
        icon,
        color: color,
      ));
}
