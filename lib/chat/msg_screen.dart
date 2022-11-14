import 'package:agora_rtm/agora_rtm.dart';
import 'package:merchant/callscreens/pickup/pick_layout.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/person/user.dart';
import 'package:merchant/providers/msg_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MessageScreen extends StatefulWidget {
  final AgoraRtmClient client;
  final LogController logController;
  final User user;
  const MessageScreen(this.client, this.logController, this.user, {Key? key})
      : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isOnline = false;
  final controller = TextEditingController();
  final box = Hive.box<User>(BoxName);
  @override
  
  void initState() {
    super.initState();
    checkUserStatus();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      user: box.get('details'),
      scaffold: Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: BLUECOLOR,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: 90.0,
                  color: BLUECOLOR,
                  child: Column(children: [
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(Icons.menu, color: Colors.white)),
                              const SizedBox(
                                width: 8.0,
                              ),
                              CircleAvatar(
                                radius: 18.0,
                                backgroundColor: Colors.grey,
                                backgroundImage: AssetImage('assets/imgs/1.png'),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text('Madeleine Penelope',
                                  style: getCustomFont(
                                      size: 18.0, color: Colors.white))
                            ],
                          ),
                        ),
                        Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.video_call,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ],
                    )
                  ]),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: ValueListenableBuilder(
                      valueListenable: widget.logController,
                      builder: (context, List<String> log, widget) {
                        return Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              itemExtent: 24,
                              itemBuilder: (context, i) {
                                return bubbleMessage(true);
                              },
                              itemCount: log.length,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                getMessageForm(
                    ctl: controller,
                    callBack: () {
                      if (controller.text.isEmpty ||
                          controller.text.trim().isEmpty) {
                        return;
                      }
                      _sendPeerMessage(controller.text.trim());
                    })
              ],
            )),
      ),
    );
  }

  void checkUserStatus() async {
    try {
      widget.client.queryPeersOnlineStatus([widget.user.uid!]).then(
          (value) => setState(() => isOnline = value[widget.user.uid]));
    } catch (errorCode) {
      if (kDebugMode) {
        print('Query error: $errorCode');
      }
    }
  }

  void _sendPeerMessage(String messageText) async {
    try {
      AgoraRtmMessage message = AgoraRtmMessage.fromText(messageText);
      await widget.client.sendMessageToPeer(widget.user.uid!, message, false);
      if (kDebugMode) {
        print('Send peer message success.');
      }
    } catch (errorCode) {
      if (kDebugMode) {
        print('Query error: $errorCode');
      }
    }
  }

  Widget bubbleMessage(isSender) {
    if (isSender) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            margin: const EdgeInsets.only(left: 80.0),
            decoration: BoxDecoration(
                color: BLUECOLOR,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Text(
              DUMMYTEXT,
              style: getCustomFont(
                  size: 15.0, color: Colors.white, weight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text('March 26, 08: 03 PM',
                    style: getCustomFont(
                      size: 14.0,
                      color: Colors.black45,
                    )),
                const SizedBox(
                  width: 3.0,
                ),
                Icon(
                  FontAwesome5.receipt,
                  color: Colors.lightBlue,
                  size: 11.0,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 80.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          decoration: BoxDecoration(
              color: BLUECOLOR,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: Text(
            DUMMYTEXT,
            style: getCustomFont(
                size: 15.0, color: Colors.white, weight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Text('March 26, 08: 03 PM',
                style: getCustomFont(
                  size: 14.0,
                  color: Colors.black45,
                )),
            const SizedBox(
              width: 3.0,
            ),
            Icon(
              FontAwesome5.receipt,
              color: Colors.lightBlue,
              size: 11.0,
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  getMessageForm({ctl, callBack}) => Container(
        height: 54.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: const Color(0xFFE8E8E8), width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Flexible(
                child: TextFormField(
              controller: ctl,
              keyboardType: TextInputType.text,
              style: getCustomFont(
                  size: 15.0, color: Colors.black45, weight: FontWeight.w400),
              decoration: InputDecoration(
                  hintText: 'Type your message....',
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  hintStyle: getCustomFont(
                      size: 15.0,
                      color: Colors.black45,
                      weight: FontWeight.w400),
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            )),
            GestureDetector(
              onTap: () => callBack(),
              child: PhysicalModel(
                elevation: 10.0,
                color: BLUECOLOR,
                borderRadius: BorderRadius.circular(100.0),
                shadowColor: BLUECOLOR.withOpacity(.5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Icon(
                    Icons.send,
                    size: 18.0,
                    color: Color(0xFF838383),
                  ),
                ),
              ),
            )
          ],
        ),
      );
}
