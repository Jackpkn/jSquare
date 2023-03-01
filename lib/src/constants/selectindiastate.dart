import 'package:flutter/material.dart';

class IndianLocationDropdown extends StatefulWidget {
  const IndianLocationDropdown({super.key});

  @override
  _IndianLocationDropdownState createState() => _IndianLocationDropdownState();
}

class _IndianLocationDropdownState extends State<IndianLocationDropdown> {
  String? _selectedState;
  String? _selectedDistrict;

  final List<String> _states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  final Map<String, List<String>> _districts = {
    'Andhra Pradesh': [
      'Anantapur',
      'Chittoor',
      'East Godavari',
      'Guntur',
      'Krishna',
      'Kurnool',
      'Nellore',
      'Prakasam',
      'Srikakulam',
      'Visakhapatnam',
      'Vizianagaram',
      'West Godavari',
      'YSR Kadapa',
    ],
    'Arunachal Pradesh': [
      'Tawang',
      'West Kameng',
      'East Kameng',
      'Papum Pare',
      'Kurung Kumey',
      'Kra Daadi',
      'Lower Subansiri',
      'Upper Subansiri',
      'West Siang',
      'East Siang',
      'Siang',
      'Upper Siang',
      'Lower Siang',
      'Lower Dibang Valley',
      'Dibang Valley',
      'Anjaw',
      'Lohit',
      'Namsai',
      'Changlang',
      'Tirap',
      'Longding',
    ],
    // add more districts for other states
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Select State',
                border: OutlineInputBorder(),
              ),
              value: _selectedState,
              onChanged: (value) {
                setState(() {
                  _selectedState = value!;
                });
              },
              items: _states.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Select District',
                border: OutlineInputBorder(),
              ),
              value: _selectedDistrict,
              onChanged: (value) {
                setState(() {
                  _selectedDistrict = value;
                });
              },
              items: _districts[_selectedState]?.map((district) {
                return DropdownMenuItem(
                  value: district,
                  child: Text(district),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
