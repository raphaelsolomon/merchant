import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.9,
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
                'Top Up Wallet',
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
              getCardForm('Enter Amount', ctl: null),
              const SizedBox(
                height: 9.0,
              ),
              getDropDownAssurance(),
              const SizedBox(
                height: 20.0,
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
          hintStyle:  getCustomFont(size: 13.0, color: Colors.black45),
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
              'Top Up',
              style: getCustomFont(
                  size: 14.0, color: Colors.white, weight: FontWeight.normal),
            ),
          ),
        ),
      );
}
