import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:flutter/material.dart';

class AddEditServices extends StatefulWidget {
  final bool isEdit;
  const AddEditServices(this.isEdit, {Key? key}) : super(key: key);

  @override
  State<AddEditServices> createState() => _AddEditServicesState();
}

class _AddEditServicesState extends State<AddEditServices> {
  String isActive = "isactive";
  bool addButtonLoading = false;
  String serviceType = '';
  File path = File('');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(
                !widget.isEdit ? 'Add Services' : 'Edit Services',
                style: getCustomFont(size: 16.0, color: Colors.black54),
              ),
            ),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.cancel_outlined,
                  size: 20.0,
                  color: Colors.black,
                ))
          ]),
          Divider(),
          Expanded(
              child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 25.0,
              ),
              getCardForm('Service Name', 'Enter Service Name', ctl: null),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Service Type',
                  style: getCustomFont(
                      size: 14.0,
                      color: Colors.black45,
                      weight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              getDropDownAssurance(),
              const SizedBox(
                height: 15.0,
              ),
              getCardForm('Charge', '100.00', ctl: null),
              const SizedBox(
                height: 15.0,
              ),
              getCardRichForm('Description', 'description', ctl: null),
              const SizedBox(
                height: 15.0,
              ),
               getCardForm('GL Codes', '', ctl: null),
              const SizedBox(
                height: 15.0,
              ),
              getCardForm('VAT', '1', ctl: null),
              const SizedBox(
                height: 15.0,
              ),
              getCardForm('IGTA', '1', ctl: null),
              const SizedBox(
                height: 17.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'Service Image',
                  style: getCustomFont(
                      size: 14.0,
                      color: Colors.black45,
                      weight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              GestureDetector(
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if (result != null) {
                    path = File(result.files.single.path!);
                    setState(() {});
                  } else {
                    // User canceled the picker
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DottedBorder(
                    dashPattern: [8, 4],
                    strokeWidth: 2,
                    color: Colors.black45,
                    padding: EdgeInsets.all(6),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_open_outlined,
                              color: BLUECOLOR,
                            ),
                            const SizedBox(width: 20.0),
                            Flexible(
                                child: Text('Browse files to upload',
                                    style: getCustomFont(
                                        size: 13.0, color: Colors.black54)))
                          ]),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(children: [
                Row(
                  children: [
                    Radio(
                        value: isActive == "isactive",
                        activeColor: BLUECOLOR,
                        groupValue: true,
                        onChanged: (b) {
                          setState(() {
                            isActive = "isactive";
                          });
                        }),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text('Active',
                        style:
                            getCustomFont(size: 14.0, color: Colors.black45)),
                  ],
                ),
                const SizedBox(
                  width: 25.0,
                ),
                Row(
                  children: [
                    Radio(
                        value: isActive == "inactive",
                        activeColor: BLUECOLOR,
                        groupValue: true,
                        onChanged: (b) {
                          setState(() {
                            isActive = "inactive";
                          });
                        }),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text('Inactive',
                        style:
                            getCustomFont(size: 14.0, color: Colors.black45)),
                  ],
                )
              ]),
              const SizedBox(
                height: 40.0,
              ),
              addButtonLoading
                  ? Center(child: CircularProgressIndicator(color: BLUECOLOR))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: getPayButton(context, () => null,
                          !widget.isEdit ? 'Save Service' : 'Update Service'),
                    ),
              const SizedBox(
                height: 20.0,
              ),
            ]),
          ))
        ],
      ),
    );
  }

  getCardForm(label, hint, {ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: getCustomFont(
                size: 14.0, color: Colors.black45, weight: FontWeight.w500),
          ),
          const SizedBox(height: 7.0),
          Container(
            height: 48.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: BLUECOLOR.withOpacity(.05)),
            child: TextField(
              controller: ctl,
              style: getCustomFont(size: 14.0, color: Colors.black45),
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }

  getCardRichForm(label, hint, {ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: getCustomFont(
                size: 14.0, color: Colors.black45, weight: FontWeight.w500),
          ),
          const SizedBox(height: 7.0),
          Container(
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: BLUECOLOR.withOpacity(.05)),
            child: TextField(
              controller: ctl,
              style: getCustomFont(size: 14.0, color: Colors.black45),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }

  getDropDownAssurance() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 49.0,
      decoration: BoxDecoration(
          color: BLUECOLOR.withOpacity(.05),
          borderRadius: BorderRadius.circular(5.0)),
      child: FormBuilderDropdown(
        name: 'skill',
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide.none),
        ),
        initialValue: 'Daily',
        onChanged: (value) => serviceType = '$value',
        items: [
          'Daily',
          'Bi-Weekly',
          'Weekly',
          'Bi-Monthly',
          'Monthly',
          'Quarterly',
          'Bi-Yearly',
          'Yearly'
        ]
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: getCustomFont(size: 14.0, color: Colors.black45),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
