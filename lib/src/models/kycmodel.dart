import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class KycModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final String addressLine1;
  final String addressLine2;
  final String addressLine3;
  final String postalCode;
  final String landmark;
  final String locality;
  final String mobileNumber;
  final String emailAddress;
  final String aadhaarNumber;
  final String panCardNumber;
  KycModel({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.postalCode,
    required this.landmark,
    required this.locality,
    required this.mobileNumber,
    required this.emailAddress,
    required this.aadhaarNumber,
    required this.panCardNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fistName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressLine3': addressLine3,
      'postalCode': postalCode,
      'landmark': landmark,
      'locality': locality,
      'mobileNumber': mobileNumber,
      'emailAddress': emailAddress,
      'aadhaarNumber': aadhaarNumber,
      'panCardNumber': panCardNumber,
    };
  }

  factory KycModel.fromMap(Map<String, dynamic> map) {
    return KycModel(
      firstName: map['fistName'] as String,
      middleName: map['middleName'] as String,
      lastName: map['middleName'] as String,
      addressLine1: map['addressLine1'] as String,
      addressLine2: map['addressLine2'] as String,
      addressLine3: map['addressLine3'] as String,
      postalCode: map['postalCode'] as String,
      landmark: map['landmark'] as String,
      locality: map['locality'] as String,
      mobileNumber: map['mobileNumber'] as String,
      emailAddress: map['emailAddress'] as String,
      aadhaarNumber: map['aadhaarNumber'] as String,
      panCardNumber: map['panCardNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory KycModel.fromJson(String source) =>
      KycModel.fromMap(json.decode(source) as Map<String, dynamic>);

  KycModel copyWith({
    String? firstName,
    String? middleName,
    String? lastName,
    String? addressLine1,
    String? addressLine2,
    String? addressLine3,
    String? postalCode,
    String? landmark,
    String? locality,
    String? mobileNumber,
    String? emailAddress,
    String? aadhaarNumber,
    String? panCardNumber,
  }) {
    return KycModel(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressLine3: addressLine3 ?? this.addressLine3,
      postalCode: postalCode ?? this.postalCode,
      landmark: landmark ?? this.landmark,
      locality: locality ?? this.locality,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      emailAddress: emailAddress ?? this.emailAddress,
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
      panCardNumber: panCardNumber ?? this.panCardNumber,
    );
  }
}
