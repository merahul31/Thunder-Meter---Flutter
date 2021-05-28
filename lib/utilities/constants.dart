import 'package:flutter/material.dart';

const kCityNameStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 55.0,
);

const kDescriptionTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
);

const kDetailHeader = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Spartan MB',
  letterSpacing: 1,
);
const kDetailValue = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Spartan MB',
);
const kDetailText = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Roboto',
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 30,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
