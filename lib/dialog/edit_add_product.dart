import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/dialog/subscribe.dart';
import 'package:flutter/material.dart';

class AddEditProduct extends StatefulWidget {
  final bool isEdit;
  const AddEditProduct(this.isEdit, {Key? key}) : super(key: key);

  @override
  State<AddEditProduct> createState() => _AddEditProductState();
}

class _AddEditProductState extends State<AddEditProduct> {
  String isActive = "isactive";
  bool addButtonLoading = false;
  String serviceType = '';
  bool isSwitch = false;
  File path = File('');
  var expiringDate  = DateTime.now();

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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.0,
                    color: Colors.black,
                  )),
              Flexible(
                child: Text(
                  !widget.isEdit ? 'Add Product' : 'Edit Product',
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
                height: 15.0,
              ),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    const SizedBox(width: 15.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 15.0,
                          backgroundColor: BLUECOLOR,
                          child: Icon(Icons.camera),
                        ),
                        const SizedBox(height: 10.0,),
                        Text(
                          'Change Image',
                          style: getCustomFont(
                              size: 14.0, color: BLUECOLOR.withOpacity(.7)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Product ID', 'Enter Product ID', ctl: null),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Product Name', 'Enter Product Name', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 3.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Product Category',
                  style: getCustomFont(
                      size: 14.0,
                      color: Colors.black45,
                      weight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDropDownAssurance(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Product Sub Category',
                  style: getCustomFont(
                      size: 14.0,
                      color: Colors.black45,
                      weight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getDropDownAssurance(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 3.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardRichForm('Description', 'description', ctl: null),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 3.0,
              ),
              const SizedBox(
                height: 1.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10.0,),
                    Flexible(
                      child: Row(
                        children: [
                          Image.asset('assets/estore/prescription.png',
                              width: 20.0, height: 20.0, fit: BoxFit.contain),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Flexible(
                            child: Text(
                              'Prescription Required',
                              style:
                                  getCustomFont(size: 13.0, color: Colors.black, weight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Theme(
                      data: ThemeData(
                          unselectedWidgetColor: BLUECOLOR.withOpacity(.5)),
                      child: Switch(
                          value: isSwitch,
                          activeColor: BLUECOLOR,
                          onChanged: (b) {
                            setState(() {
                              isSwitch = !b;
                            });
                          }),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 3.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
                child: Row(children: [
                  Flexible(child: getCardForm('Pricing', '\$0.00', ctl: null),),
                  const SizedBox(width: 10.0),
                  Flexible(child: getCardForm('Quantity', '4', ctl: null),),
                ],),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: getDateForm('Expiring Date', DateFormat('dd EEEE, MMM, yyyy').format(expiringDate), (date) {}),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('MRP', '1', ctl: null),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Shelf', '', ctl: null),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: getCardForm('Strength', '', ctl: null),
              ),
              const SizedBox(
                height: 40.0,
              ),
              addButtonLoading
                  ? Center(child: CircularProgressIndicator(color: BLUECOLOR))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: getPayButton(context, () => null,
                          !widget.isEdit ? 'Save Product' : 'Update Product'),
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

  Widget getDropDownAssurance() {
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
}
