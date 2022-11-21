import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';

class LoanConfirmationDialog extends StatefulWidget {
  const LoanConfirmationDialog({Key? key}) : super(key: key);

  @override
  State<LoanConfirmationDialog> createState() => _LoanConfirmationDialogState();
}

class _LoanConfirmationDialogState extends State<LoanConfirmationDialog> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.2,
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
                '',
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
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(
                height: 15.0,
              ),
              Text('Are you sure you want to proceed?',
                  style: getCustomFont(size: 18.0, color: Colors.black, weight: FontWeight.w500)),
              const SizedBox(
                height: 28.0,
              ),
              getButton(context, () {}),
              const SizedBox(
                height: 10.0,
              ),
              Text('No, Take Me Back',
                  style: getCustomFont(size: 17.0, color: BLUECOLOR)),
              const SizedBox(
                height: 30.0,
              ),
            ]),
          ))
        ],
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
              color: BLUECOLOR, borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: Text(
              'Complete Transaction',
              style: getCustomFont(
                  size: 14.0, color: Colors.white, weight: FontWeight.normal),
            ),
          ),
        ),
      );
}
