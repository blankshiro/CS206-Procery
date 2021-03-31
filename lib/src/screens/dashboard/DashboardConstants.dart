import 'package:flutter/material.dart';

Color kPrimaryColor = Color(0xFF27AE60);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 8,
  offset: Offset(0, 0),
);

// same as buildTextTitleVariation1 (without the bottom padding)
buildTextTitleVariation3(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
    ),
  );
}
