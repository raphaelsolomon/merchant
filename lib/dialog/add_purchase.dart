import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AddPurchase extends StatefulWidget {
  final bool isEdit;
  const AddPurchase(this.isEdit, {Key? key}) : super(key: key);

  @override
  State<AddPurchase> createState() => _AddPurchaseState();
}

class _AddPurchaseState extends State<AddPurchase> {
  bool addButtonLoading = false;
  String country = 'Nigeria';
  bool isSwitch = false;
  File path = File('');
  var currentDate = DateTime.now();
  var expiringDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.0,
                        color: Colors.black,
                      )),
                  Flexible(
                    child: Text(
                      !widget.isEdit ? 'Add Vendor' : 'Edit Vendor',
                      style: getCustomFont(size: 16.0, color: Colors.black54),
                    ),
                  ),
                  Icon(
                    null,
                    size: 20.0,
                    color: Colors.black,
                  )
                ]),
          ),
          Divider(),
          Expanded(
              child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 35.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDropDownAssurance(MERCHANTTYPE, (s) {}),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Customer Name', 'Customer Name', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Invoice No.', 'Invoice No.', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Purchase ID', 'Purchase ID', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDropDownAssurance(['Cash', 'Transfer', 'Invoice'], (s) {}),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDateForm('Purchase Date', DateFormat('dd EEEE, MMM, yyyy').format(expiringDate), (d){}),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDateForm('Ording Date', DateFormat('dd EEEE, MMM, yyyy').format(currentDate), (d){}),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Product Name', 'Product Name', ctl: null),
              ),
               const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDateForm('Expiring Date', DateFormat('dd EEEE, MMM, yyyy').format(currentDate), (d){}),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Quantity', '0', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Supplier price', '0.00', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('VAT', '0.00', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Discount', '0.00', ctl: null),
              ),
              const SizedBox(
                height: 40.0,
              ),
              addButtonLoading
                  ? Center(child: CircularProgressIndicator(color: BLUECOLOR))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: getPayButton(context, () => null,
                          !widget.isEdit ? 'Save Purchase' : 'Update Purchase'),
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

  Widget getCardForm(label, hint, {ctl}) {
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

  Widget getCardRichForm(label, hint, {ctl}) {
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

  getPhoneNumberForm(label, {ctl}) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            Text(
              '$label',
              style: getCustomFont(
                  size: 14.0, color: Colors.black45, weight: FontWeight.w500),
            ),
            const SizedBox(height: 7.0),
            Container(
              height: 54.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: BLUECOLOR.withOpacity(.05)),
              child: Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: PhoneFormField(
                      key: Key('phone-field'),
                      controller: ctl, // controller & initialValue value
                      shouldFormat: true, // default
                      defaultCountry: IsoCode.NG, // default
                      style: getCustomFont(size: 14.0, color: Colors.black45),
                      autovalidateMode: AutovalidateMode.disabled,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.0),
                          hintText: 'Mobile Number', // default to null
                          hintStyle:
                              getCustomFont(size: 15.0, color: Colors.black45),
                          border: OutlineInputBorder(
                              borderSide: BorderSide
                                  .none) // default to UnderlineInputBorder(),
                          ),
                      validator: null,
                      isCountryChipPersistent: false, // default
                      isCountrySelectionEnabled: true, // default
                      countrySelectorNavigator:
                          CountrySelectorNavigator.dialog(),
                      showFlagInInput: true, // default
                      flagSize: 15, // default
                      autofillHints: [
                        AutofillHints.telephoneNumber
                      ], // default to null
                      enabled: true, // default
                    ),
                  )),
                  PhysicalModel(
                    elevation: 10.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Icon(
                        Icons.smartphone,
                        size: 18.0,
                        color: Color(0xFF838383),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget getDropDownAssurance(List<String> list, callBack) {
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
        initialValue: list[0],
        onChanged: (value) => callBack(value),
        items: list
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

  Widget getDateForm(label, text, callBack) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: getCustomFont(
                size: 14.0, color: Colors.black54, weight: FontWeight.normal),
          ),
          //abr to undo
          const SizedBox(
            height: 5.0,
          ),
          Container(
            height: 45.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
                color: BLUECOLOR.withOpacity(.05),
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('$text',
                      style: getCustomFont(size: 14.0, color: Colors.black45)),
                )),
                GestureDetector(
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: expiringDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101));
                    if (picked != null && picked != expiringDate) {
                      callBack(picked);
                    }
                  },
                  //done
                  child: PhysicalModel(
                    elevation: 10.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7.0, vertical: 7.0),
                      child: Icon(
                        Icons.calendar_month,
                        size: 15.0,
                        color: Color(0xFF838383),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  getCountryForm({text = 'Nigeria'}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        child: Column(
          children: [
            Text(
              'Country',
              style: getCustomFont(
                  size: 14.0, color: Colors.black54, weight: FontWeight.normal),
            ),
            //abr to undo
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 54.0,
              decoration: BoxDecoration(
                  color: BLUECOLOR.withOpacity(.05),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Text(
                      '$text',
                      style: getCustomFont(size: 15.0, color: Colors.black45),
                    ),
                  )),
                  PhysicalModel(
                    elevation: 10.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Icon(
                        FontAwesome5.globe,
                        size: 18.0,
                        color: Color(0xFF838383),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
