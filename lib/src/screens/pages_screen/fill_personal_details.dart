import 'package:flutter/material.dart';
import 'package:jsquare/src/widgets/container.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../../widgets/textfromfield.dart';

class DetailFillPage extends StatefulWidget {
  const DetailFillPage({super.key});

  @override
  State<DetailFillPage> createState() => _DetailFillPageState();
}

class _DetailFillPageState extends State<DetailFillPage> {
  final TextEditingController controller = TextEditingController();

  String countryValue = '';

  String stateValue = '';

  String cityValue = '';
  List<Map> availableHobbies = [
    {"name": "Save this address to my profile", "isChecked": false},
    // {"name": "Make this my preferred address", "isChecked": false},
  ];

  List<dynamic> countries = [];
  String? countryId;
  @override
  void initState() {
    countries.add({"id": "1", "name": "India"});
    countries.add({"id": "2", "lable": "UAE"});
    super.initState();
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Your name and Address: ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text(
                    '*   Name of reciever as per aadhaar card',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    labelText: ' First Name',
                    hintText: 'Enter Your First Name',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: ' Enter Your Middle Name',
                    labelText: ' Middle Name',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: ' Enter Your Last Name',
                    labelText: ' Last Name',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Address Line 1',
                    labelText: 'Address Line 1',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Address Line 2',
                    labelText: 'Address Line 2',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Address Line 3',
                    labelText: 'Address Line 3',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Pin code Number',
                    labelText: 'Postal Code',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Pin  LandMark',
                    labelText: 'LandMark',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 7,
                  ),

                  const SizedBox(
                    height: 0,
                  ),
                  FormHelper.dropDownWidget(
                    context,
                    "Select Product Type",
                    "",
                    countries,
                    (onChangedVal) {
                      countryId = onChangedVal;
                    },
                    (onValidateVal) {
                      if (onValidateVal == null) {
                        return 'Please Select Product Type';
                      }

                      return null;
                    },
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderColor: Theme.of(context).splashColor,
                    borderRadius: 10,
                    optionLabel: 'name',
                    optionValue: 'val',
                  ),
                  // Column(
                  //     children: availableHobbies.map((hobby) {
                  //   return CheckboxListTile(
                  //       value: hobby["isChecked"],
                  //       title: Text(hobby["name"]),
                  //       controlAffinity: ListTileControlAffinity.leading,
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           hobby["isChecked"] = newValue;
                  //         });
                  //       });

                  // }).toList()),

                  Align(
                    alignment: Alignment.topLeft,
                    child: CheckboxListTile(
                        value: false,
                        // title: const Text('Save this address to my profile'),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (newValue) {
                          setState(() {});
                        }),
                  ),
                  const Text(
                    'Contact Information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Pin  Mobile Number',
                    labelText: 'Mobile Number',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Pin  Email Address',
                    labelText: 'Email Address',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Aadhaar & PAN information',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Aadhaar   number',
                    labelText: 'Aadhaar Number',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormInput(
                    onSaved: (p) {},
                    hintText: 'Enter Your Aadhaar   number',
                    labelText: 'PAN ',
                    validator: (P) {
                      return null;
                    },
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                      child: GlobalContainer(
                    borderWidth: 1,
                    height: 65,
                    radius: 60,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                      // Container(
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(60),
                      //     border: Border.all(
                      //       color: Colors.black,
                      //       width: 1,
                      //     ),
                      //   ),
                      //   child: const Align(
                      //     alignment: Alignment.center,
                      //     child: Text(
                      //       'Continue',
                      //       style: TextStyle(
                      //         fontSize: 24,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ),
                  const SizedBox(
                    height: 20,
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
/*
 CSCPicker(
                    layout: Layout.vertical,
                    showCities: true,
                    showStates: true,
                    disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.shade600,
                        width: 1,
                      ),
                    ),
                    dropdownDialogRadius: 10,
                    searchBarRadius: 16,
                    dropdownHeadingStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    dropdownItemStyle: const TextStyle(fontSize: 16),
                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",

                    ///labels for dropdown
                    countryDropdownLabel: "Country",
                    stateDropdownLabel: "State/Territory",
                    cityDropdownLabel: "Address Type",
                    onCountryChanged: (value) {
                      setState(() {
                        ///store value in country variable
                        countryValue = value;
                      });
                    },

                    ///triggers once state selected in dropdown
                    onStateChanged: (value) {
                      setState(() {
                        ///store value in state variable
                        stateValue = value.toString();
                      });
                    },

                    ///triggers once city selected in dropdown
                    onCityChanged: (value) {
                      setState(() {
                        ///store value in city variable
                        cityValue = value.toString();
                      });
                    },
                  ),
*/