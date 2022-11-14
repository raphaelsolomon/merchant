import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:merchant/auth/login.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/firebase_options.dart';
import 'package:merchant/model/person/user.dart';
import 'package:merchant/notification/helper_notification.dart';
import 'package:merchant/pages/homepage.dart';
import 'package:merchant/pages/page_selector.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/providers/user_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:phone_form_field/l10n/generated/phone_field_localization.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

bool isFlutterLocalNotificationsInitialized = false;
late AndroidNotificationChannel channel;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('A bg message just showed up : ${message.messageId}');
}

// key ID W3GQWWTG35
// 4M5F6CFH72
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isIOS ? await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      : await Firebase.initializeApp(name: 'merchant', options: DefaultFirebaseOptions.currentPlatform);
  final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (remoteMessage != null) {
    print(remoteMessage);
  }
  await HelperNotification.initialize();
  HelperNotification.onNotification.stream.listen(onClickedEvent);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(UserAdapter());

  await Hive.openBox<User>(BoxName);
  await Hive.openBox(ReferralBox);
  await Hive.openBox('Initialization');

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ErrorWidget.builder = (details) => Material(
        child: Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                details.exceptionAsString(),
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
}

void onClickedEvent(String? payload) {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final box = Hive.box('Initialization');
  final Box<User> user = Hive.box<User>(BoxName);

  @override
  void initState() {
   // context.read<UserProvider>().executeThis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
      ],
      child: RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: GetMaterialApp(
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            PhoneFieldLocalization.delegate
          ],
          locale: Locale('en'),
          supportedLocales: const [
            const Locale('en'),
            const Locale('zh'),
            const Locale('ja'),
            const Locale('uk'),
            const Locale('it'),
            const Locale('ru'),
            const Locale('fr'),
            const Locale('es'),
            const Locale('nl'),
            const Locale('sv'),
            const Locale('pt'),
            const Locale('ko'),
          ],
          localeListResolutionCallback: (locales, supportedLocales) {
            return locales!.first;
          },
          title: 'Merchant',
          defaultTransition: Transition.zoom,
          debugShowCheckedModeBanner: true,
          builder: (context, child) => ScrollConfiguration(
            child: child!,
            behavior: ScrollBehavior(),
          ),
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primarySwatch: Colors.blue,
              primaryColor: Colors.black54),
          home: box.get('isFirst') == null
              ? const PageSelection()
              : user.get(USERPATH) == null
                  ? const AuthLogin()
                  : Container() //DashBoard(),
        ),
      ),
    );
  }
}
