import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AddCoupon extends StatefulWidget {
  const AddCoupon({Key? key}) : super(key: key);

  @override
  State<AddCoupon> createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.0,
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
                'Add Coupon',
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
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Coupon Name',
                  style: getCustomFont(size: 13.0, color: Colors.black45),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              getCardForm('Coupon Name', ctl: null),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Coupon Discount',
                  style: getCustomFont(size: 13.0, color: Colors.black45),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              getCardForm('Coupon Discount', ctl: null),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
              //   child: Text(
              //     'Coupon Description',
              //     style: getCustomFont(size: 13.0, color: Colors.black45),
              //   ),
              // ),
              // const SizedBox(
              //   height: 2.0,
              // ),
              // getCardRichForm('description', ctl: null),
              const SizedBox(
                height: 10.0,
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Expire Date',
                  style: getCustomFont(size: 13.0, color: Colors.black45),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              getDateForm(DateFormat('yyyy-MM-dd').format(selectedDate),
                  () async {
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101));
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              }),
              const SizedBox(
                height: 10.0,
              ),
              getButton(context, () {}),
              const SizedBox(
                height: 30.0,
              ),
            ]),
          ))
        ],
      ),
    );
  }

  getDateForm(text, callBack) => Container(
        height: 54.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text('$text',
                  style: getCustomFont(size: 13.0, color: Colors.black45)),
            )),
            GestureDetector(
              onTap: () => callBack(),
              child: PhysicalModel(
                elevation: 10.0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Icon(
                    Icons.calendar_month,
                    size: 18.0,
                    color: Color(0xFF838383),
                  ),
                ),
              ),
            )
          ],
        ),
      );

  getCardRichForm(hint, {ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: BLUECOLOR.withOpacity(.1)),
        child: TextField(
          style: getCustomFont(size: 14.0, color: Colors.black45),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }

  getCardForm(hint, {ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: BLUECOLOR.withOpacity(.1)),
        child: TextField(
          style: getCustomFont(size: 14.0, color: Colors.black45),
          maxLines: 1,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }

  getDropDownAssurance() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 49.0,
      decoration: BoxDecoration(
          color: BLUECOLOR.withOpacity(.1),
          borderRadius: BorderRadius.circular(5.0)),
      child: FormBuilderDropdown(
        name: 'select',
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Select Payment Method',
          hintStyle: getCustomFont(size: 13.0, color: Colors.black45),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide.none),
        ),
        items: ['Male', 'Female']
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: getCustomFont(size: 13.0, color: Colors.black45),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget getButton(context, callBack) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 45.0,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          decoration: BoxDecoration(
              color: BLUECOLOR, borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: Text(
              'Request',
              style: getCustomFont(
                  size: 14.0, color: Colors.white, weight: FontWeight.normal),
            ),
          ),
        ),
      );
}
