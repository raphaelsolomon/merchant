import 'package:agora_rtm/agora_rtm.dart';
import 'package:merchant/callscreens/pickup/pick_layout.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/model/person/user.dart';
import 'package:merchant/pages/customer_supplier.dart';
import 'package:merchant/pages/dashboard.dart';
import 'package:merchant/pages/mystore.dart';
import 'package:merchant/providers/msg_log.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/resuable/custom_nav.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class PageSelection extends StatefulWidget {
  const PageSelection({Key? key}) : super(key: key);

  @override
  State<PageSelection> createState() => _PageSelectionState();
}

class _PageSelectionState extends State<PageSelection> {
  AgoraRtmClient? _client;
  LogController logController = LogController();
  final scaffold = GlobalKey<ScaffoldState>();
  final box = Hive.box<User>(BoxName);

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      FirebaseMessaging.instance.getToken().then((value) => print(value));
      dialogMessage(context, subscribe(context));
      createClient();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _client!.logout();
  }

  @override
  Widget build(BuildContext context) {
    final page = context.watch<HomeController>().getPage;
    return KeyboardVisibilityBuilder(
        builder: (context, isVisible) => WillPopScope(
            onWillPop: () => context.read<HomeController>().onBackPress(),
            child: PickupLayout(
                user: box.get('details'),
                scaffold: Scaffold(
                    key: scaffold,
                    drawer: !removeBottom.contains(page)
                        ? navDrawer(context, scaffold, box)
                        : null,
                    backgroundColor: Colors.white,
                    body: Stack(children: [
                      _pages(page, scaffold),
                      !isVisible &&
                              (!removeBottom.contains(page) &&
                                  !removeBottom1.contains(page))
                          ? Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomNavBar(
                                context,
                                pageIndex: 0,
                              ))
                          : SizedBox()
                    ])))));
  }

  void createClient() async {
    _client = await AgoraRtmClient.createInstance(APP_ID);
    _client!.login(null, 'box.get(USERPATH)!.uid!');
    _client!.onMessageReceived = (AgoraRtmMessage message, String peerId) {
      logController.addLog("Private Message from $peerId: ${message.text}");
    };
    _client!.onConnectionStateChanged = (int state, int reason) {
      if (kDebugMode) {
        print('Connection state changed: $state, reason: $reason');
      }
      if (state == 5) {
        _client!.logout();
        if (kDebugMode) {
          print('Logout.');
        }
      }
    };
  }

  Widget _pages(page, scaffold) {
    if (page == 2) {
      return MyStore();
    }
    if (page == 1) {
      return MyDashBoard(scaffold);
    }
    return CustomerAndSupplier();
  }
}
//
//
//
//SELECT commodity, COUNT(*) AS magnitude FROM commodities WHERE userId=8 GROUP BY commodity ORDER BY magnitude DESC//
//SELECT status, COUNT(*) AS magnitude FROM commodities GROUP BY status ORDER BY magnitude DESC LIMIT 2