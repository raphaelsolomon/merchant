import 'package:merchant/providers/page_controller.dart';
import 'package:merchant/resuable/custom_nav.dart';
import 'package:merchant/store/by_brand.dart';
import 'package:merchant/store/categories_and_sub.dart';
import 'package:merchant/store/store_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class StorePage extends StatefulWidget {
  final int i;
  const StorePage(this.i, {super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  String page = 'Overview';
  List<String> headers = [
    'Overview'
    'Appointments',
    'Prescriptions',
    'Medical Records',
    'Billing'
  ];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>().setStoreIndex(widget.i);
    });
    super.initState();
  }

  Future<bool> onBackPress() async {
    if (context.read<HomeController>().storeIndex == 0) {
      context.read<HomeController>().isEstore(false);
      return true;
    }
    context.read<HomeController>().setStoreIndex(0);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var index = context.watch<HomeController>().storeIndex;
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                color: Color(0xFFf6f6f6),
                child: index == 0
                    ? getDashboard(context, width)
                    : index == 2
                        ? getHospital(context, 
                        () => Get.to(() => CategoriesAndSub()),
                        onBack: () =>  context.read<HomeController>().setStoreIndex(0))
                        : index == 3
                            ? getPharmacy(
                                context, () =>  context.read<HomeController>().setStoreIndex(4),
                                onBack: () =>  context.read<HomeController>().setOnStoreBack())
                            : index == 4
                                ? ByBrand(() => context.read<HomeController>().setOnStoreBack())
                                : getProfile(page, context, () {}, headers,
                                    dash: (e) {
                                    setState(() {
                                      page = e;
                                    });
                                  })),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomNavBar(context, pageIndex: widget.i))
          ],
        ),
      ),
    );
  }
}
