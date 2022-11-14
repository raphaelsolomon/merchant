
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:merchant/auth/otp.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/person/user.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  const HomePage(this.scaffold, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box<User>(BoxName);
  User? user;
  bool isImage = true;

  @override
  void initState() {
    user = box.get(USERPATH);
   // isImage = user!.profilePhoto == null ? false : true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: Color(0xFFf6f6f6),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () =>
                              widget.scaffold.currentState!.openDrawer(),
                          child: Icon(Icons.menu, color: Colors.black)),
                          const SizedBox(width: 10.0),
                          
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: BLUECOLOR.withOpacity(.3),
                              backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-vector/flat-hand-drawn-patient-taking-medical-examination-illustration_23-2148859982.jpg?w=2000'),
                              radius: 15.0,
                            ),
                            const SizedBox(width: 10.0,),
                            CircleAvatar(
                              backgroundColor: BLUECOLOR.withOpacity(.3),
                              radius: 15.0,
                              child: Icon(Icons.shopping_cart, color: Colors.black45, size: 18.0,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 50.0),
                  child: FittedBox(
                    child: Text(
                      'Welcome, Uchiha Madara',
                      style: getCustomFont(
                          size: 26.0,
                          color: Colors.black,
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'What would you like to do today?',
                    style: getCustomFont(
                        size: 13.0,
                        color: Colors.black,
                        weight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                isImage
                    ? const SizedBox()
                    : Column(
                        children: [
                          GestureDetector(
                              onTap: () =>
                                  Get.to(() => AuthOtp(user!.email!, true)),
                              child: mailAlert(context)),
                          const SizedBox(
                            height: 29.0,
                          ),
                        ],
                      ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        ...List.generate(
                            4, (index) => horizontalSecondItem(context))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Top Services', style: getCustomFont(size: 16.0, color: Colors.redAccent, weight: FontWeight.w500),),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        ...List.generate(homeItem1.length,
                            (i) => horizontalItem(homeItem1[i]))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        ...List.generate(homeItem2.length,
                            (i) => horizontalItem(homeItem2[i]))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () => context.read<HomeController>().setPage(-23),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'View All Specialization',
                        style: getCustomFont(
                            size: 14.0, color: BLUECOLOR, weight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                viewAllSpecial(),
                viewAllSpecial(),
                viewAllSpecial(),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () => context.read<HomeController>().setPage(-0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'View All Services',
                        style: getCustomFont(
                            size: 14.0, color: BLUECOLOR, weight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                viewAllSpecial(),
                viewAllSpecial(),
                viewAllSpecial(),
                const SizedBox(height: 90.0,)
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget viewAllSpecial() => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Flexible(
              fit: FlexFit.tight,
              child: Text(
                'Addiction psychiatrists',
                style: getCustomFont(size: 14.0, color: Colors.black54),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.arrow_forward_ios,
                size: 18.0, color: Colors.black87),
          )
        ]),
      );

  Widget horizontalItem(homeItem1) => GestureDetector(
        child: Container(
          width: 160.0,
          height: 230.0,
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              Image.asset(
                'assets/imgs/1.png',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                '${homeItem1['title']}',
                textAlign: TextAlign.center,
                style: getCustomFont(
                    size: 15.5, color: Colors.black, weight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                '${homeItem1['desc']}',
                textAlign: TextAlign.center,
                maxLines: 3,
                style: getCustomFont(
                    size: 12.0, color: Colors.black45, weight: FontWeight.w400),
              ),
              const SizedBox(
                height: 2.0,
              ),
            ],
          ),
        ),
      );

  Widget horizontalSecondItem(context) => Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: 100.0,
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
            color: BLUECOLOR.withOpacity(.5),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [],
        ),
      );

  Widget mailAlert(context) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
        margin: const EdgeInsets.only(right: 20.0, left: 20.0),
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(.2),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/message.png',
                width: 50.0, height: 50.0, fit: BoxFit.contain),
            const SizedBox(
              width: 15.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                      child: Text(
                    'E-mail Verification Pending',
                    style: getCustomFont(
                        size: 18.0,
                        color: Colors.black,
                        weight: FontWeight.bold),
                  )),
                  const SizedBox(height: 1.0),
                  FittedBox(
                      child: Text(
                    'verify your email to link your account',
                    style: getCustomFont(
                        size: 14.0,
                        color: Colors.black54,
                        weight: FontWeight.w400),
                  )),
                ],
              ),
            ),
            const SizedBox(
              width: 30.0,
            ),
            Icon(
              Icons.warning,
              color: Colors.red,
              size: 19.0,
            )
          ],
        ),
      );
}
