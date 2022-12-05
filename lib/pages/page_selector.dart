import 'package:agora_rtm/agora_rtm.dart';
import 'package:merchant/auth/change_password.dart';
import 'package:merchant/auth/profile_settings.dart';
import 'package:merchant/callscreens/pickup/pick_layout.dart';
import 'package:merchant/company/favourite.dart';
import 'package:merchant/company/loan.dart';
import 'package:merchant/company/myoffer.dart';
import 'package:merchant/company/myreferral.dart';
import 'package:merchant/company/notification.dart';
import 'package:merchant/company/notificationsetting.dart';
import 'package:merchant/company/medicine_list.dart';
import 'package:merchant/company/rateus.dart';
import 'package:merchant/company/shareapp.dart';
import 'package:merchant/company/support.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/addcustomer.dart';
import 'package:merchant/dialog/addvendor.dart';
import 'package:merchant/dialog/edit_add_product.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:merchant/model/person/user.dart';
import 'package:merchant/pages/account.dart';
import 'package:merchant/pages/book_doctor/search_doctors.dart';
import 'package:merchant/pages/customer_supplier.dart';
import 'package:merchant/pages/dashboard.dart';
import 'package:merchant/pages/homepage.dart';
import 'package:merchant/pages/invoice.dart';
import 'package:merchant/pages/my_calendar.dart';
import 'package:merchant/pages/mystore.dart';
import 'package:merchant/pages/services.dart';
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
                      !isVisible && (!removeBottom.contains(page) && !removeBottom1.contains(page))
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
    if (page == 23) {
      return SearchDoctor();
    }
    if (page == 22) {
      return AddEditProduct(false);
    }
    if (page == 21) {
      return Services(); //specialization
    }
    if (page == 20) {
      return Services(); //services
    }
    if (page == 19) {
      return PurchaseList();
    }
    if (page == 18) {
      return GetLoan();
    }
    if (page == 16) {
      return AuthChangePass();
    }
    if (page == 17) {
      return NotificationSettingsPage();
    }
    if (page == 12) {
      return MyReferrals();
    }
    if (page == 13) {
      return SupportPage();
    }
    if (page == 14) {
      return RateUS();
    }
    if (page == 15) {
      return ShareApp();
    }
    if (page == 9) {
      return MyOffer();
    }
    if (page == 10) {
      return MyInvoicePage();
    }
    if (page == 11) {
      return MyFavourite();
    }
    if (page == 8) {
      return AccountPage();
    }
    if (page == 7) {
      return CustomerAndSupplier('Suppliers');
    }
    if (page == -7) {
      return Addvendors(false);
    }
    if (page == 6) {
      return ProfileSettings();
    }
    if (page == 5) {
      return CustomerAndSupplier('Customers');
    }
    if (page == -5) {
      return AddCustomers(false);
    }
    if (page == 3) {
      return MyCalendar();
    }
    if (page == 2) {
      return MyStore();
    }
    if (page == 1) {
      return MyDashBoard(scaffold);
    }
    if (page == -1) {
      return const SizedBox();
    }
    if (page == 0) {
      return HomePage(scaffold);
    }
    return NotificationPage();
  }
}
//
//
//
//SELECT commodity, COUNT(*) AS magnitude FROM commodities WHERE userId=8 GROUP BY commodity ORDER BY magnitude DESC//
//SELECT status, COUNT(*) AS magnitude FROM commodities GROUP BY status ORDER BY magnitude DESC LIMIT 2