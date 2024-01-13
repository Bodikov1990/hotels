import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TouristInfoModel {
  Widget icon;
  bool isExpanded;
  String name;
  String lastName;
  String birthDate;
  String citizenship;
  String passportNumber;
  String passportExpiryDate;
  String phone;
  String email;

  TouristInfoModel(
      {Widget icon = const Icon(Icons.arrow_drop_down),
      this.isExpanded = false,
      this.name = '',
      this.lastName = '',
      this.birthDate = '',
      this.citizenship = '',
      this.passportNumber = '',
      this.passportExpiryDate = '',
      this.phone = '',
      this.email = ''})
      : icon = SvgPicture.asset(
          "assets/images/arrow_down.svg",
          width: 24,
          height: 24,
        );
}
