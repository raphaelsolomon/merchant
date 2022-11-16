import 'package:merchant/constant/strings.dart';
import 'package:merchant/resuable/form_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:image_picker/image_picker.dart';

class PrescriptionUpload extends StatefulWidget {
  final Function onBackPress;
  PrescriptionUpload(this.onBackPress, {super.key});

  @override
  State<PrescriptionUpload> createState() => _PrescriptionUploadState();
}

class _PrescriptionUploadState extends State<PrescriptionUpload> {
  final ImagePicker _picker = ImagePicker();

  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        color: BLUECOLOR,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => widget.onBackPress(),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 19.0,
                        )),
                    Text('Upload Prescription',
                        style: getCustomFont(size: 17.0, color: Colors.white)),
                    Icon(
                      null,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
            ]),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            GestureDetector(
                onTap: () async {
                  photo = await _picker.pickImage(source: ImageSource.camera);
                },
                child: createPrescriptionButton(
                    context, FontAwesome5.camera, 'Camera')),
            const SizedBox(
              height: 15.0,
            ),
            GestureDetector(
                onTap: () async {
                  photo = await _picker.pickImage(source: ImageSource.camera);
                },
                child: createPrescriptionButton(
                    context, FontAwesome5.file_import, 'From Gallery')),
            const SizedBox(
              height: 15.0,
            ),
            createPrescriptionButton(
                context, Icons.file_copy, 'My Prescriptions'),
            const SizedBox(
              height: 30.0,
            ),
            Text('Prescription Guide',
                style: getCustomFont(
                    size: 17.0, color: Colors.black, weight: FontWeight.w500)),
            const SizedBox(
              height: 20.0,
            ),
            GestureDetector(
                onTap: () {},
                child: createPrescriptionNote(
                    'Do not crop out any part of the prescription')),
            const SizedBox(
              height: 15.0,
            ),
            createPrescriptionNote('Avoid blurred images'),
            const SizedBox(
              height: 15.0,
            ),
            createPrescriptionNote('Include details of doctor & patient'),
            const SizedBox(
              height: 15.0,
            ),
            createPrescriptionNote('medicine will deliver as per prescription'),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ))
    ]);
  }
}
