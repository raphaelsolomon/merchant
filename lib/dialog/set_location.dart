import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';

class SetLocation extends StatefulWidget {
  final bool isEdit;
  const SetLocation(this.isEdit, {Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  bool addButtonLoading = false;
  var selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
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
                            widget.isEdit ? 'Edit Award' : 'Add Award',
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
                          getCardForm('Award Name', 'Enter Award Name',
                              ctl: null),
                          const SizedBox(
                            height: 15.0,
                          ),
                          getCardRichForm(
                              'Award Description', 'Enter Award Description',
                              ctl: null),
                          const SizedBox(
                            height: 15.0,
                          ),
                          getDateForm(
                              'Award Date',
                              DateFormat('dd EEEE, MMM, yyyy')
                                  .format(selectedDate),
                              () {}),
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

  Widget getDateForm(label, text, callBack) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label',
              style: getCustomFont(
                  size: 13.0, color: Colors.black54, weight: FontWeight.normal),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 45.0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.transparent),
                  color: BLUECOLOR.withOpacity(.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text('$text',
                        style:
                            getCustomFont(size: 13.0, color: Colors.black45)),
                  )),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));
                      if (picked != null && picked != selectedDate) {
                        callBack(picked);
                      }
                    },
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
}
