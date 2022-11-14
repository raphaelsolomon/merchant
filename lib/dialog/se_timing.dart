import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';

class SetTiming extends StatefulWidget {
  const SetTiming({Key? key}) : super(key: key);

  @override
  State<SetTiming> createState() => _SetTimingState();
}

class _SetTimingState extends State<SetTiming> {
  bool addButtonLoading = false;
  Map<String, dynamic> timing = {
    'Mon': {'start': '00:00 PM', 'end': '00:00 PM', 'active': false},
    'Tues': {'start': '00:00 PM', 'end': '00:00 PM', 'active': true},
    'Wed': {'start': '00:00 PM', 'end': '00:00 PM', 'active': false},
    'Thurs': {'start': '00:00 PM', 'end': '00:00 PM', 'active': true},
    'Fri': {'start': '00:00 PM', 'end': '00:00 PM', 'active': true},
    'Sat': {'start': '00:00 PM', 'end': '00:00 PM', 'active': false},
    'Sun': {'start': '00:00 PM', 'end': '00:00 PM', 'active': true},
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Set Timing',
                            style: getCustomFont(
                                size: 16.0, color: Colors.black54),
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25.0,
                          ),
                          dateItem('Sun'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          dateItem('Mon'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          dateItem('Tues'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          dateItem('Wed'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          dateItem('Thurs'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          dateItem('Fri'),
                          const SizedBox(
                            height: 20.0,
                          ),
                          dateItem('Sat'),
                          const SizedBox(
                            height: 40.0,
                          ),
                        ]),
                  ))
                ],
              ),
            ),
          ),
          addButtonLoading
              ? Center(child: CircularProgressIndicator(color: BLUECOLOR))
              : getPayButton(context, () => null, 'Save'),
        ],
      ),
    );
  }

  dateItem(String key) => Row(mainAxisSize: MainAxisSize.max, children: [
        Flexible(
          child: Row(
            children: [
              SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Checkbox(
                      value: timing[key]['active'],
                      onChanged: (b) {
                        if (b == true) {
                          timing[key]['active'] = false;
                        } else {
                          timing[key]['active'] = true;
                        }
                        setState(() {});
                      })),
              const SizedBox(
                width: 15.0,
              ),
              Text('$key',
                  style: getCustomFont(size: 14.0, color: Colors.black87)),
            ],
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: GestureDetector(
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    setState(() {
                      timing[key]['start'] = DateFormat("HH:mm a").format(
                          new DateTime(
                              2000, 1, 1, pickedTime!.hour, pickedTime.minute));
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: BLUECOLOR.withOpacity(.05)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              '${timing[key]['start']}',
                              style: getCustomFont(size: 13.0, color: Colors.black54),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          Icons.timer,
                          size: 18.0,
                        )
                      ],
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('to',
                      style: getCustomFont(size: 14.0, color: Colors.black54)),
                ),
                Flexible(
                    child: GestureDetector(
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      timing[key]['end'] = DateFormat("HH:mm a").format(
                          new DateTime(
                              2000, 1, 1, pickedTime!.hour, pickedTime.minute));
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: BLUECOLOR.withOpacity(.05)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Text(
                              '${timing[key]['end']}',
                              style: getCustomFont(size: 13.0, color: Colors.black54),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Icon(
                          Icons.timer,
                          size: 18.0,
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ))
      ]);

  getDropDownAssurance({callBack}) {
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
        onChanged: (value) => callBack('$value'),
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

  Widget getPayButton(context, callBack, text) => GestureDetector(
        onTap: () => callBack(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: BLUECOLOR),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Center(
              child: Text(
                '$text',
                style: getCustomFont(
                    size: 15.0, color: Colors.white, weight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );
}
