import 'dart:io';

import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:paw_in_out/utils/images.dart';
import 'package:paw_in_out/widgets/text_field.dart';

class AdoptionForm extends StatefulHookWidget {
  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  late File file;

  @override
  Widget build(BuildContext context) {
    var gender = useState('he');
    return Scaffold(
      backgroundColor: Colors.amber[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: DirectSelectContainer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Post an Adoption",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 0.05.sh),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      // height: 102.sh,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DirectSelectFeild(
                            data: ["Male", "Female"],
                            onSelect: (val, _, __) {
                              gender.value = val == "Male" ? 'he' : 'she';
                            },
                          ),
                          CustomTextFormField(
                            label: 'What does ${gender.value} respond to?',
                          ),
                          DirectSelectFeild(
                            data: ["Dog", "Cat", "Birds", "Fish", "Rabbit"],
                          ),
                          DirectSelectFeild(
                            data: const [
                              "Labrador",
                              "German Shepard",
                              "Beagle",
                              "BullDog",
                              "Golden Retriver",
                              "Shihtzu",
                              "Great Dane",
                              "Dolmation"
                            ],
                          ),
                          DirectSelectFeild(
                            data: const [
                              "Black",
                              "White",
                              "Brunnete",
                              "Brown",
                              "Gold",
                              "RedBrown",
                              "Dolmation"
                            ],
                          ),
                          CustomTextFormField(
                            label: 'What fluffy is ${gender.value}?',
                          ),
                          CustomTextFormField(
                            label: 'How tall is ${gender.value}?',
                          ),
                          CustomTextFormField(
                            label: 'Does ${gender.value} Have any illness?',
                          ),
                          const CustomTextFormField(
                            label: 'Why do you wish to post this adoption?',
                            maxLines: 3,
                          ),
                          Text(
                              "Let's show the world how cute ${gender.value} is?",
                              style: Theme.of(context).textTheme.bodyMedium),
                          SizedBox(
                            height: 0.035.sh,
                          ),
                          InkWell(
                            onTap: () async {
                              final res = await showModal(context);
                              print(res);
                              setState(() {
                                file = res;
                              });
                            },
                            child: CircleAvatar(
                              radius: 0.1.sh,
                              // ignore: unnecessary_null_comparison
                              backgroundImage: file == null
                                  ? const AssetImage(
                                      'assets/icons/pawprint.png')
                                  : FileImage(file),
                            ),
                          ),
                          SizedBox(
                            height: 0.05.sh,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.amber[300],
                              ),
                              child: const Icon(Icons.check),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<File> showModal(BuildContext context) async {
  late File res;
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      height: 0.1.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () async {
              res = await pickImage();
            },
            icon: const Icon(MaterialCommunityIcons.album),
          ),
          IconButton(
            onPressed: () async {
              res = await pickImage(useCamera: true);
            },
            icon: const Icon(MaterialCommunityIcons.camera),
          )
        ],
      ),
    ),
  );

  return res;
}

class DirectSelectFeild extends StatelessWidget {
  final buttonPadding = const EdgeInsets.fromLTRB(0, 8, 0, 0);

  final List<String> data ;
  final String? label;
  final Function(String, int, BuildContext)? onSelect;

  DirectSelectFeild({
    super.key,
    required this.data,
    this.label,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //     alignment: AlignmentDirectional.centerStart,
        //     // margin: EdgeInsets.only(left: 4),
        //     child: Text(
        //       label,
        //       style: Theme.of(context).textTheme.bodyText2,
        //     )),
        Padding(
          padding: buttonPadding,
          child: Container(
            // decoration: _getShadowDecoration(),
            child: Card(
                elevation: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: DirectSelectList<String>(
                              values: data,
                              defaultItemIndex: 0,
                              itemBuilder: (String value) =>
                                  getDropDownMenuItem(value),
                              focusedItemDecoration: _getDslDecoration(),
                              onItemSelectedListener: onSelect,
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _getDropdownIcon(),
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
      itemHeight: 56,
      value: value,
      itemBuilder: (context, value) {
        return Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }

  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  // BoxDecoration _getShadowDecoration() {
  //   return BoxDecoration(
  //     boxShadow: <BoxShadow>[
  //       new BoxShadow(
  //         color: Colors.black.withOpacity(0.06),
  //         spreadRadius: 4,
  //         offset: new Offset(0.0, 0.0),
  //         blurRadius: 15.0,
  //       ),
  //     ],
  //   );
  // }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }
}
