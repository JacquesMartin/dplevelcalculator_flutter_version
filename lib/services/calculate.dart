import 'package:dplevelcalculator/services/converter.dart';
import 'package:flutter/material.dart';

class LRVandURV extends ChangeNotifier {
  String _lrvResult = '';
  String _urvResult = '';

  String get lrvResult => _lrvResult;
  String get urvResult => _urvResult;

  void calculate(
      {int index,
      String measurementUnit,
      String pressureUnit,
      double lmax,
      double lmin,
      double hRef,
      double dtx,
      double sgProcess,
      double sgFill,
      double sg1,
      double sg2,
      double overflowHeight}) {
    switch (index) {
      //Capillary Two Seal
      case 0:
        //LRV Formula
        double rawLrv = (lmin * sgProcess) - (hRef * sgFill);
        //Convert to units selected
        LRVConverter convLrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = convLrv.convertLRV();

        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) - (hRef * sgFill);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();
        notifyListeners();
        break;

      //Impulse Wet Leg
      case 1:
        //URV
        double rawUrv = (lmax * sgProcess) +
            (lmin * sgProcess) +
            (dtx * sgProcess) -
            (hRef * sgFill);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();

        //LRV
        double rawLrv =
            (lmin * sgProcess) + (dtx * sgProcess) - (hRef * sgFill);
        LRVConverter convLrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = convLrv.convertLRV();

        notifyListeners();
        break;
      //Impulse Dry Leg
      case 2:
        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) + (dtx * sgProcess);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();
        //LRV
        double rawLrv = (lmin * sgProcess) + (dtx * sgProcess);
        LRVConverter conv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convertLRV();

        notifyListeners();
        break;
      //Capillary Interface
      case 3:
        //URV
        double rawUrv =
            (overflowHeight) * (sg1) + (lmax + lmin) * (sg2) - (hRef * sgFill);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();

        //LRV
        double rawLrv =
            (overflowHeight + lmax) * (sg1) + (lmin * sg2) - (hRef * sgFill);
        LRVConverter conv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convertLRV();

        notifyListeners();
        break;
      case 4: //Single Impulse Wet Leg

        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) + (dtx * sgProcess);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();

        //LRV
        double rawLrv = (lmin * sgProcess) + (dtx * sgProcess);
        LRVConverter conv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convertLRV();

        notifyListeners();
        break;
      case 5: //Capillary Zero Elevation

        //URV
        double rawUrv = ((lmax + lmin) * sgProcess) - (dtx * sgFill);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();

        //LRV
        double rawLrv = (lmin * sgProcess) - (dtx * sgFill);
        LRVConverter conv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convertLRV();

        notifyListeners();
        break;
      case 6: //Capillary Zero Suppression

        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) + (dtx * sgFill);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();

        //LRV
        double rawLrv = (lmin * sgProcess) + (dtx * sgFill);
        LRVConverter conv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convertLRV();

        notifyListeners();
        break;
      case 7: //Bubbler System

        //URV
        double rawUrv = (lmax * sgProcess) + (lmin * sgProcess);
        LRVConverter convUrv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convertLRV();

        //LRV
        double rawLrv = (lmin * sgProcess);
        LRVConverter conv = LRVConverter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convertLRV();

        notifyListeners();
        break;
      default:
    }
  }
}
