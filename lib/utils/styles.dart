import 'package:flutter/material.dart';

final kTextFieldDecor = InputDecoration(
  filled: true,
  fillColor: Colors.amber.shade50,
  alignLabelWithHint: true,
  border: const OutlineInputBorder(
      gapPadding: 0,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

const kMainTitle = TextStyle(
  fontSize: 40,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

const kMainLoginTitle = TextStyle(
  color: Color(0xf0ff5252),
  fontSize: 45,
  fontWeight: FontWeight.w700,
);

const kTitle = TextStyle(
  color: Color(0xf0ff5252),
  fontSize: 23,
  fontWeight: FontWeight.w700,
);

const kTagTitle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

const kToggleSelected =
TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);

const kToggleNotSelected = TextStyle(
    color: Color(0xffef9a9a), fontWeight: FontWeight.w700, fontSize: 18);

const kLabelStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

const kInfoText = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w600,
);

const kGenderSelected =
TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 30);

const kGenderNotSelected = TextStyle(
    fontWeight: FontWeight.w700, color: Color(0xffef9a9a), fontSize: 30);

const kDateStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);

const kSearchFieldDecor = InputDecoration(
  alignLabelWithHint: true,
  hintText: 'Search Here',
  hintStyle: TextStyle(color: Colors.white70),
  border: InputBorder.none,
);
