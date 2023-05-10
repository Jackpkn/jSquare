import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Address/services/address_services.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import '../../../GlobalWidgets/textfromfield.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName = 'checkout-page';
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // final TextEditingController controller = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController addressLine3Controller = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aadhaarNumberController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();

  String countryValue = '';

  String stateValue = '';
  UserServices userServices = Get.put(UserServices());
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

  final AddressServices addressServices = Get.put(AddressServices());

  final _key = GlobalKey<FormState>();
  savedUserAddress() {
    if (_key.currentState!.validate()) {
      addressServices.saveUserAddress(
        firstName: firstNameController.text.trim(),
        middleName: middleNameController.text,
        lastName: lastNameController.text,
        addressLine1: addressLine1Controller.text,
        addressLine2: addressLine2Controller.text,
        addressLine3: addressLine3Controller.text,
        postalCode: postalCodeController.text,
        locality: localityController.text,
        landmark: landmarkController.text,
        mobileNumber: mobileController.text,
        emailAddress: emailController.text,
        aadhaarNumber: aadhaarNumberController.text,
        panCardNumber: panNumberController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Checkout',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text(
                      '★ Name of reciever as per aadhaar card',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      labelText: ' First Name',
                      hintText: 'Enter Your First Name',
                      controller: firstNameController,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: ' Enter Your Middle Name',
                      labelText: ' Middle Name',
                      controller: middleNameController,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: ' Enter Your Last Name',
                      labelText: ' Last Name',
                      controller: lastNameController,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Address Line 1',
                      labelText: 'Address Line 1',
                      controller: addressLine1Controller,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Address Line 2',
                      labelText: 'Address Line 2',
                      controller: addressLine2Controller,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Address Line 3',
                      labelText: 'Address Line 3',
                      controller: addressLine3Controller,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Pin code Number',
                      labelText: 'Postal Code',
                      controller: postalCodeController,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Pin  LandMark',
                      labelText: 'LandMark',
                      controller: landmarkController,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Pin  locality',
                      labelText: 'locality',
                      controller: localityController,
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    // FormHelper.dropDownWidget(
                    //   context,
                    //   "Select Product Type",
                    //   "",
                    //   countries,
                    //   (onChangedVal) {
                    //     countryId = onChangedVal;
                    //   },
                    //   (onValidateVal) {
                    //     if (onValidateVal == null) {
                    //       return 'Please Select Product Type';
                    //     }

                    //     return null;
                    //   },
                    //   borderFocusColor: Theme.of(context).primaryColor,
                    //   borderColor: Theme.of(context).splashColor,
                    //   borderRadius: 10,
                    //   optionLabel: 'name',
                    //   optionValue: 'val',
                    // ),
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

                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: CheckboxListTile(
                    //       value: false,
                    //       // title: const Text('Save this address to my profile'),
                    //       controlAffinity: ListTileControlAffinity.leading,
                    //       onChanged: (newValue) {
                    //         setState(() {});
                    //       }),
                    // ),
                    const Text(
                      'Contact Information',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Pin  Mobile Number',
                      labelText: 'Mobile Number',
                      controller: mobileController,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Pin  Email Address',
                      labelText: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Aadhaar & PAN information',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Aadhaar   number',
                      labelText: 'Aadhaar Number',
                      controller: aadhaarNumberController,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormInput(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty";
                        }
                        return null;
                      },
                      obscureText: false,
                      hintText: 'Enter Your Aadhaar   number',
                      labelText: 'PAN ',
                      controller: panNumberController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        savedUserAddress();
                      },
                      child: const Text('jack'),
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       savedUserAddress;
                    //     },
                    //     child: GlobalContainer(
                    //       borderWidth: 1,
                    //       height: 65,
                    //       radius: 60,
                    //       width: MediaQuery.of(context).size.width,
                    //       child: const Text(
                    //         'Continue',
                    //         style: TextStyle(fontSize: 24),
                    //       ),
                    //     )
                    //     // Container(
                    //     //   height: 70,
                    //     //   decoration: BoxDecoration(
                    //     //     borderRadius: BorderRadius.circular(60),
                    //     //     border: Border.all(
                    //     //       color: Colors.black,
                    //     //       width: 1,
                    //     //     ),
                    //     //   ),
                    //     //   child: const Align(
                    //     //     alignment: Alignment.center,
                    //     //     child: Text(
                    //     //       'Continue',
                    //     //       style: TextStyle(
                    //     //         fontSize: 24,
                    //     //       ),
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
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