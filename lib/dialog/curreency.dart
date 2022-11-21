import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';

class CurrencyDialog extends StatefulWidget {
  const CurrencyDialog({super.key});

  @override
  State<CurrencyDialog> createState() => _CurrencyDialogState();
}

class _CurrencyDialogState extends State<CurrencyDialog> {

String currency = 'Dollar';

  @override
  Widget build(BuildContext context) {
    return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        width: 400.0,
        margin:
            const EdgeInsets.all(40), // to push the box half way below circle
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                color: BLUECOLOR,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Choose Language',
                    style: getCustomFont(size: 16.0, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15.0,),
              items('Dollar', callBack: () => setState(() => currency = 'Dollar'), selected: currency == 'Dollar'),
              const SizedBox(height: 5.0,),
              Divider(),
               const SizedBox(height: 5.0,),
              items('Naira', callBack: () => setState(() => currency = 'Naira'), selected: currency == 'Naira'),
               const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    ],
  );
  }
  Widget items(text, {callBack, bool selected = false}) => Padding(
   padding: const EdgeInsets.symmetric(horizontal: 20.0),
   child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: FittedBox(
                child: Text('$text',
                    style: getCustomFont(
                        color: Colors.black,
                        size: 15.0,
                        weight: FontWeight.w500)),
              ),
            ),
            SizedBox(
                height: 10.0,
                width: 10.0,
                child: Radio(
                  activeColor: BLUECOLOR,
                  onChanged: (b) {
                  callBack();
                }, value: selected, groupValue: true)),
           
          ],
        ),
 );
}