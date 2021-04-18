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
        Converter convLrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = convLrv.convert();

        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) - (hRef * sgFill);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();
        notifyListeners();
        break;

      //Impulse Wet Leg
      case 1:
        //URV
        print(lmax);
        double rawUrv = (lmax * sgProcess) +
            (lmin * sgProcess) +
            (dtx * sgProcess) -
            (hRef * sgFill);
        print(rawUrv);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();

        //LRV
        double rawLrv =
            (lmin * sgProcess) + (dtx * sgProcess) - (hRef * sgFill);
        Converter convLrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = convLrv.convert();

        notifyListeners();
        break;
      //Impulse Dry Leg
      case 2:
        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) + (dtx * sgProcess);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();
        //LRV
        double rawLrv = (lmin * sgProcess) + (dtx * sgProcess);
        Converter conv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convert();

        notifyListeners();
        break;
      //Capillary Interface
      case 3:
        //URV
        double rawUrv =
            (overflowHeight) * (sg1) + (lmax + lmin) * (sg2) - (hRef * sgFill);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();

        //LRV
        double rawLrv =
            (overflowHeight + lmax) * (sg1) + (lmin * sg2) - (hRef * sgFill);
        Converter conv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convert();

        notifyListeners();
        break;
      case 4: //Single Impulse Wet Leg

        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) + (dtx * sgProcess);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();

        //LRV
        double rawLrv = (lmin * sgProcess) + (dtx * sgProcess);
        Converter conv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convert();

        notifyListeners();
        break;
      case 5: //Capillary Zero Elevation

        //URV
        double rawUrv = ((lmax + lmin) * sgProcess) - (dtx * sgFill);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();

        //LRV
        double rawLrv = (lmin * sgProcess) - (dtx * sgFill);
        Converter conv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convert();

        notifyListeners();
        break;
      case 6: //Capillary Zero Suppression

        //URV
        double rawUrv =
            (lmax * sgProcess) + (lmin * sgProcess) + (dtx * sgFill);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();

        //LRV
        double rawLrv = (lmin * sgProcess) + (dtx * sgFill);
        Converter conv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convert();

        notifyListeners();
        break;
      case 7: //Bubbler System

        //URV
        double rawUrv = (lmax * sgProcess) + (lmin * sgProcess);
        Converter convUrv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawUrv);
        _urvResult = convUrv.convert();

        //LRV
        double rawLrv = (lmin * sgProcess);
        Converter conv = Converter(
            measurementUnit: measurementUnit,
            pressureUnit: pressureUnit,
            rawLrv: rawLrv);
        _lrvResult = conv.convert();

        notifyListeners();
        break;
      default:
    }
  }
}
