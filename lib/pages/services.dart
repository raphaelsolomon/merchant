
import 'package:flutter/material.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/specialization.model.dart';
import 'package:merchant/providers/page_controller.dart';
import 'package:provider/provider.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List<SpecializationModel> specialization = [
    SpecializationModel(title: 'Addiction Psychiatrist', isSelected: true),
    SpecializationModel(title: 'Gynaecologist', isSelected: false),
    SpecializationModel(title: 'Dentist', isSelected: true),
    SpecializationModel(title: 'Dermatologist', isSelected: false),
    SpecializationModel(title: 'Optician', isSelected: false),
    SpecializationModel(title: 'Neurologist', isSelected: false),
    SpecializationModel(title: 'Cardiologist', isSelected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFf6f6f6),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: BLUECOLOR,
                child: Column(children: [
                  const SizedBox(
                    height: 45.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () =>
                                context.read<HomeController>().onBackPress(),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18.0,
                            )),
                        Text('Search Services',
                            style:
                                getCustomFont(color: Colors.white, size: 16.0)),
                        Icon(
                          null,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ]),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: getCardForm('Search Services Here'),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 2) * 1.3,
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 30.0, bottom: 30.0, right: 30.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          color: BLUECOLOR),
                      child: Text(
                        'Select your Services',
                        style: getCustomFont(size: 14.0, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ...List.generate(
                                    specialization.length,
                                    (i) => viewAllSpecial(
                                        context, specialization[i]))
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              )
            ])),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: FloatingActionButton.extended(
              label: Text('Save'),
              icon: Icon(
                Icons.check_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
              backgroundColor: BLUECOLOR,
            ),
          ),
        ),
      ],
    );
  }

  Widget getCardForm(hint, {ctl}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Container(
      height: 48.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade200),
      child: Row(
        children: [
          const SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.search,
            color: Colors.black87,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Flexible(
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
        ],
      ),
    ),
  );
}

  Widget viewAllSpecial(
          BuildContext context, SpecializationModel specialization) =>
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 9.0),
        child: Column(
          children: [
            Row(children: [
              Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    '${specialization.title}',
                    style: getCustomFont(size: 13.0, color: Colors.black87),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        specialization
                            .setIsSelected(!specialization.isSelected);
                      });
                    },
                    child: Icon(
                        specialization.isSelected
                            ? Icons.check_circle
                            : Icons.circle_outlined,
                        size: 18.0,
                        color: specialization.isSelected
                            ? Colors.green
                            : Colors.grey)),
              )
            ]),
            const SizedBox(
              height: 1.0,
            ),
            Divider(),
            const SizedBox(
              height: 1.0,
            ),
          ],
        ),
      );
}
