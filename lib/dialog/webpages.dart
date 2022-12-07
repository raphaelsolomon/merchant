import 'dart:async';
import 'dart:io';

import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OtherWebPages extends StatefulWidget {
  final String title;
  const OtherWebPages(this.title, {Key? key}) : super(key: key);

  @override
  State<OtherWebPages> createState() => _OtherWebPagesState();
}

class _OtherWebPagesState extends State<OtherWebPages> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // _completer.future.then((controller) {
    //   _webViewController = controller;
    //   Map<String, String> header =  {'cookie': 'token=$token'};
    //   _webViewController.loadUrl(URL, headers: header);
    // });
    var size = MediaQuery.of(context).size;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFf6f6f6),
        child: Column(children: [
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
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios,
                          size: 18.0, color: Colors.white)),
                  Flexible(
                    child: Text('${widget.title}',
                        style: getCustomFont(size: 16.0, color: Colors.white)),
                  ),
                  Icon(
                    null,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
            ]),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
              child: WebView(
            debuggingEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: ((WebViewController controller) {
              controller.loadUrl("", headers: {"Authorization": "Bearer "});
              _completer.complete(controller);
            }),
          ))
        ]));
  }
}

// onWebViewCreated: (controller) async {
//               _completer.complete(controller);
//             })),