import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/notification_model.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  String frequency = 'Daily';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                 
                  Text('Notification Settings',
                      style:
                          getCustomFont(size: 16.0, color: Colors.white)),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white),
                    child: Text(
                      'save',
                      style: getCustomFont(size: 11.0, color: BLUECOLOR),
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
            height: 10.0,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                items(NotificationSettingsModel(
                  title: 'Annoucements',
                  description:
                      'Be the first to know about new features and other news',
                  isSelected: false,
                )),
                const SizedBox(
                  height: 8.0,
                ),
                items(NotificationSettingsModel(
                    title: 'Special Offer',
                    description: 'Receive last minuted offer from us',
                    isSelected: false)),
                const SizedBox(
                  height: 8.0,
                ),
                items(
                  NotificationSettingsModel(
                    title: 'Review Survey',
                    description:
                        'Share your payment experience for better experience user',
                    isSelected: false,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                items(NotificationSettingsModel(
                    title: 'For New launched Project',
                    description: 'Get information of new launch',
                    isSelected: true)),
                const SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Frequency Of Notification',
                    style: getCustomFont(
                        size: 16.0,
                        color: Colors.black,
                        weight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                createPrescriptionButton('Daily'),
                createPrescriptionButton('Alternate Day'),
                createPrescriptionButton('Weekly'),
              ],
            ),
          )),
        ]));
  }

  Widget createPrescriptionButton(text) => Container(
        width: MediaQuery.of(context).size.width,
        height: 45.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: getCustomFont(
                  size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
            Radio(
                value: frequency == text,
                groupValue: true,
                activeColor: BLUECOLOR,
                onChanged: (b) {
                  setState(() {
                    frequency = text;
                  });
                })
          ],
        ),
      );

  Widget items(NotificationSettingsModel settings) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              settings.title!,
              style: getCustomFont(size: 15.0, color: Colors.black, weight: FontWeight.w500),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              settings.description!,
              style: getCustomFont(size: 14.0, color: Colors.black54),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() => settings.selectedItem(true));
                  },
                  child: Row(
                    children: [
                      checkBox(settings.isSelected!),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'On',
                        style: getCustomFont(size: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() => settings.selectedItem(false));
                  },
                  child: Row(
                    children: [
                      checkBox(!settings.isSelected!),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Off',
                        style: getCustomFont(size: 16.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      );

  checkBox(bool b) => Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(width: 1.0, color: Colors.black45)),
        child: Container(
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: !b ? Colors.white : BLUECOLOR,
                )),
      );
}
