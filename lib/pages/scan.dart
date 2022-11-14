import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merchant/pages/scan_camera.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:merchant/constant/strings.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18.0,
                        )),
                    Image.asset('assets/imgs/logo.png',
                        width: 150.0, fit: BoxFit.contain),
                    GestureDetector(
                      onTap:() => Get.to(() => ScanCameraPage()),
                      child: Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ]),
            ),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Text(
                    'Scan QR Code with theskydoctors app to complete payment.You can view the details of your transacction in your transactions history.',
                    textAlign: TextAlign.center,
                    style: getCustomFont(size: 14.0, color: Colors.black45),
                  ),
                ),
                const SizedBox(height: 25.0,),
                QrImage(
                  data: 'This is a simple QR code',
                  version: QrVersions.auto,
                  size: 300,
                  gapless: false,
                ),
                const SizedBox(height: 35.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: const Divider(
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Text(
                        'Pay with',
                        style: GoogleFonts.poppins(
                            fontSize: 13.0,
                            color: Color(0xFF838391),
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        child: const Divider(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                 const SizedBox(height: 30.0,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/pay/visa.png', width: 30.0, height: 30.0, fit: BoxFit.contain),
                    const SizedBox(width: 15.0),
                    Image.asset('assets/pay/razor.png', width: 30.0, height: 30.0, fit: BoxFit.contain),
                    const SizedBox(width: 15.0),
                    Image.asset('assets/pay/zenith.png', width: 30.0, height: 30.0, fit: BoxFit.contain),
                  ],
                 )
              ],
            )),
          ])),
    );
  }
}
