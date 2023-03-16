import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:merchant/auth/login.dart';
import 'package:merchant/auth/register.dart';
import 'package:merchant/constant/strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? _pageController;
  final box = Hive.box('Initialization');
  int counter = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView.builder(
            controller: _pageController,
            itemCount: ONBOARDING.length,
            onPageChanged: ((value) => setState(() => counter = value)),
            itemBuilder: ((context, index) => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(image: AssetImage(ONBOARDING[index]['image']), repeat: ImageRepeat.noRepeat),
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(30.0),
                            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0, bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: Column(children: [
                              Spacer(),
                              Text(
                                '${ONBOARDING[index]['title']}',
                                style: GoogleFonts.poppins(color: BLUECOLOR, fontSize: 15.0, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                '${ONBOARDING[index]['description']}',
                                style: GoogleFonts.poppins(color: BODYTEXT, fontSize: 13.0, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              dotIndicator(counter),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (counter == 4) {
                                    box.put('isFirst', false);
                                    Get.to(() => AuthLogin());
                                  } else {
                                    counter = counter + 1;
                                    _pageController!.animateToPage(counter, duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
                                  }
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: BLUECOLOR,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                        child: Text(
                                      counter == 4 ? 'Continue' : 'Next',
                                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600),
                                    ))),
                              ),
                              counter == 4 ? const SizedBox() : const Spacer(),
                              Visibility(
                                visible: counter < 4,
                                child: InkWell(
                                  onTap: () {
                                    box.put('isFirst', false);
                                    Get.to(() => AuthRegister());
                                  },
                                  child: Text(
                                    'Skip for now',
                                    style: GoogleFonts.poppins(color: GREYTEXT, fontSize: 16.0, fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Spacer()
                            ])))
                  ],
                )))),
      ),
    );
  }

  Widget dotIndicator(index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: index == 0 ? BLUECOLOR : BLUECOLOR.withOpacity(.4),
          radius: 5.0,
        ),
        const SizedBox(
          width: 7.0,
        ),
        CircleAvatar(
          backgroundColor: index == 1 ? BLUECOLOR : BLUECOLOR.withOpacity(.4),
          radius: 5.0,
        ),
        const SizedBox(
          width: 7.0,
        ),
        CircleAvatar(
          backgroundColor: index == 2 ? BLUECOLOR : BLUECOLOR.withOpacity(.4),
          radius: 5.0,
        ),
        const SizedBox(
          width: 7.0,
        ),
        CircleAvatar(
          backgroundColor: index == 3 ? BLUECOLOR : BLUECOLOR.withOpacity(.4),
          radius: 5.0,
        ),
        const SizedBox(
          width: 7.0,
        ),
        CircleAvatar(
          backgroundColor: index == 4 ? BLUECOLOR : BLUECOLOR.withOpacity(.4),
          radius: 5.0,
        ),
      ],
    );
  }
}
