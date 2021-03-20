import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';

/////////////////////////////////
///   TEXT STYLES
////////////////////////////////
const logoStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Colors.black,
);

const logoWhiteStyle = TextStyle(
    fontFamily: 'Poppins', fontSize: 21, letterSpacing: 2, color: Colors.white);
const whiteText = TextStyle(color: Colors.white, fontFamily: 'Poppins');
const disabledText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const contrastText = TextStyle(color: primaryColor, fontFamily: 'Poppins');
const contrastTextBold = TextStyle(
    color: primaryColor, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

const h3 = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const h5 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins');

const h6 = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins');

const priceText = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins');

const foodNameText = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins');

const foodNameSubText = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins');

const tabLinkStyle = TextStyle(fontWeight: FontWeight.w500);

const taglineText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
const categoryText = TextStyle(
    color: Color(0xff444444),
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins');

const inputFieldTextStyle =
    TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500);

const inputFieldHintTextStyle =
    TextStyle(fontFamily: 'Poppins', color: Color(0xff444444));

const inputFieldPasswordTextStyle = TextStyle(
    fontFamily: 'Poppins', fontWeight: FontWeight.w500, letterSpacing: 3);

const inputFieldHintPaswordTextStyle = TextStyle(
    fontFamily: 'Poppins', color: Color(0xff444444), letterSpacing: 2);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const authPlateDecoration = BoxDecoration(
    color: white,
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, .1),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(0, 1))
    ],
    borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)));

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    borderSide: BorderSide(
      color: primaryColor,
    ));

const inputFieldDefaultBorderStyle = OutlineInputBorder(
    gapPadding: 0, borderRadius: BorderRadius.all(Radius.circular(6)));

/////////////////////////////////////
/// RECIPE STYLES
////////////////////////////////////
buildTextTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24),
    child: Text(
      text,
      style: logoStyle,
    ),
  );
}

buildTextTitleVariation(String text) {
  return Column(children: [
    SizedBox(
      height: 16,
    ),
    // Words
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          buildTextTitleVariation1(text),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    ),
  ]);
}

buildTextTitleVariation2(String text, bool opacity) {
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: opacity ? Colors.grey : Colors.black,
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}

buildRecipeTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

buildRecipeSubTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}

buildCalories(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

/////////////////////////////////////
/// DASHBOARD STYLES
////////////////////////////////////

buildExpiryDays(String text) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: Colors.red,
      fontWeight: FontWeight.w600,
    ),
  );
}

buildGroceryTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        // decoration: TextDecoration.lineThrough,
        // decorationThickness: 2,
        // decorationColor: primaryColor,
      ),
    ),
  );
}

buildGrocerySubtitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );
}
