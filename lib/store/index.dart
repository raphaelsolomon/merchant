import 'package:flutter/material.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:provider/provider.dart';

class StorePage extends StatefulWidget {
  final int i;
  const StorePage(this.i, {Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

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
        body: Stack(children: [
            Container(
                width: width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                color: Color(0xFFf6f6f6),)
        ]),
      ),
    );
  }
}