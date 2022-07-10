import 'package:flutter/material.dart';

const HAS_BEEN_ON_BOARDED = 'hasBeenOnBoarder';
const USER_CREDENTIALS = 'userCredentials';

const kTextColor = Color(0xFF757575);
const kTextLightColor = Color(0xFF7286A5);
const kDefaultPadding = 20.0;
final kGreyColor = Color(0xFFF1F2F3);

const kInputBgColor = Color(0xFFF7F7F8);
const themeInputDecoration = InputDecoration(
  fillColor: kInputBgColor,
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
  labelStyle:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: kTextColor),
  enabledBorder: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Color(0x333B4933)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue),
  ),
  // // errorBorder: OutlineInputBorder(
  // //   borderRadius: BorderRadius.circular(10),
  // //   borderSide: BorderSide(
  // //     color: Colors.amber
  // //   )
  // // ),
);

const personnePhysique = {"membershipFee": 1000.0, "inscriptionFee": 2000.0};
const personnePhysiqueExploitant = {
  "membershipFee": 2000.0,
  "inscriptionFee": 3000.0
};
const personneMorale = {"membershipFee": 2500.0, "inscriptionFee": 4000.0};
