import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:merchant/auth/login.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/person/user.dart';

class SeledtionPage extends StatefulWidget {
  const SeledtionPage({Key? key}) : super(key: key);

  @override
  State<SeledtionPage> createState() => _SeledtionPageState();
}

class _SeledtionPageState extends State<SeledtionPage> {
  final user = Hive.box<User>(BoxName);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: user.listenable(),
      builder: ((context, value, child) =>
          user.get('details') == null ? const AuthLogin() : Container()),
    );
  }
}
