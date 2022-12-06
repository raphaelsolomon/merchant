import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {

  var currentDate = DateTime.now();

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
                'Withdrawal',
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
                  SizedBox(width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    Text('Total Earnings',style: getCustomFont(size: 15.0, color: BLUECOLOR),),
                      Text('\$75,000.00',style: getCustomFont(size: 30.0, color: BLUECOLOR, weight: FontWeight.w600),)

                  ]),
                  ),
const SizedBox(
            height: 30.0,
          ),
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Minimum amount to withdraw', style: getCustomFont(size: 13.0, color: Colors.black45),),
              ),
              const SizedBox(height: 2.0,),
              getCardForm('5000.00', ctl: null),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Optional note', style: getCustomFont(size: 13.0, color: Colors.black45),),
              ),
              const SizedBox(height: 2.0,),
              getCardRichForm('Note', ctl: null),
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Select where to withdraw', style: getCustomFont(size: 13.0, color: Colors.black45),),
              ),
              const SizedBox(height: 2.0,),
              getDropDownAssurance(),
              const SizedBox(
                height: 10.0,
              ),
              getDateForm('Date', '', (date) {}),
              const SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Password', style: getCustomFont(size: 13.0, color: Colors.black45),),
              ),
              const SizedBox(height: 2.0,),
              getCardPasswordForm('Password'),
               const SizedBox(
                height: 30.0,
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
        height: 45.0,
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

  getCardPasswordForm(hint, {ctl}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: BLUECOLOR.withOpacity(.1)),
        child: TextField(
          style: getCustomFont(size: 14.0, color: Colors.black45),
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              hintStyle: getCustomFont(size: 14.0, color: Colors.black45),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ),
    );
  }

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

  getDropDownAssurance() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 45.0,
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
          hintText: 'Bank Transfer',
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

  Widget getDateForm(label, text, callBack) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
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
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
              decoration: BoxDecoration(
                  color: BLUECOLOR.withOpacity(.1),
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
                          initialDate: currentDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));
                      if (picked != null && picked != currentDate) {
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
        ),
  );

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
              'Withdraw',
              style: getCustomFont(
                  size: 14.0, color: Colors.white, weight: FontWeight.normal),
            ),
          ),
        ),
      );
}
