import 'package:dplevelcalculator/models/pressure_model.dart';
import 'package:dplevelcalculator/services/calculate.dart';
import 'package:dplevelcalculator/widgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class PressureDetailScreen extends StatelessWidget {
  final Pressure pressure;
  final int index;

  PressureDetailScreen({this.pressure, this.index});

  @override
  Widget build(BuildContext context) {
    final lmaxController = TextEditingController();
    final lminController = TextEditingController();
    final hrefCOntroller = TextEditingController();
    final dtxController = TextEditingController();
    final sgpController = TextEditingController();
    final sgfController = TextEditingController();
    final sg2Controller = TextEditingController();
    final overflowController = TextEditingController();

    List<String> unitsItem = ['in', 'mm', 'cm', 'ft', 'm'];

    List<String> pressureUnitsItems = [
      'mbar',
      'mmH2O',
      'psi',
      'MPa',
      'kPa',
      'bar',
      'inH2O',
      'kg/cm2'
    ];

    String pressureUnit = 'in';

    double size = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
        create: (context) => LRVandURV(),
        child: ScaffoldWidget(
            index: index,
            lmaxController: lmaxController,
            lminController: lminController,
            sgpController: sgpController,
            hrefCOntroller: hrefCOntroller,
            sgfController: sgfController,
            size: size,
            pressure: pressure,
            dtxController: dtxController,
            overflowController: overflowController,
            sg2Controller: sg2Controller,
            pressureUnit: pressureUnit,
            unitsItem: unitsItem));
  }
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    Key key,
    @required this.index,
    @required this.lmaxController,
    @required this.lminController,
    @required this.sgpController,
    @required this.hrefCOntroller,
    @required this.sgfController,
    @required this.size,
    @required this.pressure,
    @required this.dtxController,
    @required this.overflowController,
    @required this.sg2Controller,
    @required this.pressureUnit,
    @required this.unitsItem,
  }) : super(key: key);

  final int index;
  final TextEditingController lmaxController;
  final TextEditingController lminController;
  final TextEditingController sgpController;
  final TextEditingController hrefCOntroller;
  final TextEditingController sgfController;

  final double size;
  final Pressure pressure;
  final TextEditingController dtxController;
  final TextEditingController overflowController;
  final TextEditingController sg2Controller;
  final String pressureUnit;
  final List<String> unitsItem;

  @override
  Widget build(BuildContext context) {
    final lrvProvider = Provider.of<LRVandURV>(context, listen: false);

    return Scaffold(
      backgroundColor: kMainColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Calculate',
          style: TextStyle(
              fontFamily: 'Raleway', fontWeight: FontWeight.w600, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        icon: Image(
          height: 25.0,
          width: 25.0,
          image: AssetImage('assets/backgrounds/icons/ic_equals.png'),
        ),
        onPressed: () {
          switch (index) {
            case 0: //Capillary Two Seal
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                hRef: double.parse(hrefCOntroller.text),
                sgFill: double.parse(sgfController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 1: //Open Tank Single Wet Leg
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                dtx: double.parse(dtxController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 2: //Impulse Dry Leg
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                dtx: double.parse(dtxController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 3: //Capillary Interface
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sg1: double.parse(sgpController.text),
                sg2: double.parse(sg2Controller.text),
                hRef: double.parse(hrefCOntroller.text),
                sgFill: double.parse(sgfController.text),
                overflowHeight: double.parse(overflowController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 4: //Impulse Wet Leg
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                dtx: double.parse(dtxController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 5: //Capillary Zero Elevation
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                dtx: double.parse(dtxController.text),
                sgFill: double.parse(sgfController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 6: //Capillary Zero Suppression
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                sgFill: double.parse(sgfController.text),
                dtx: double.parse(dtxController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;
            case 7: //Bubbler System
              lrvProvider.calculate(
                index: index,
                lmax: double.parse(lmaxController.text),
                lmin: double.parse(lminController.text),
                sgProcess: double.parse(sgpController.text),
                measurementUnit: 'in',
                pressureUnit: 'mbar',
              );
              break;

            default:
          }
        },
      ),
      body: Consumer<LRVandURV>(
        builder: (context, value, __) => NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: size * .35,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Hero(
                      tag: pressure.name,
                      child: Image(
                          image: AssetImage(pressure.imageUrl),
                          fit: BoxFit.cover)),
                ),
              ),
            ];
          },
          body: Shortcuts(
            shortcuts: <LogicalKeySet, Intent>{
              LogicalKeySet(LogicalKeyboardKey.space): const NextFocusIntent(),
            },
            child: FocusTraversalGroup(
              child: Form(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      padding: EdgeInsets.only(top: 10.0),
                      children: <Widget>[
                        Text(
                          pressure.name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Raleway'),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        if (lrvProvider.lrvResult != null &&
                            lrvProvider.urvResult != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Upper Range Value(URV):',
                                          style:
                                              TextStyle(fontFamily: 'Raleway'),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '${lrvProvider.lrvResult}',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Text('Lower Range Value(LRV):',
                                          style:
                                              TextStyle(fontFamily: 'Raleway')),
                                      SizedBox(height: 10),
                                      Text(
                                        '${lrvProvider.urvResult}',
                                        //lrv == null ? ' ' : '${lrv}',
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        SizedBox(height: 10),
                        TextFormField(
                            controller: lmaxController,
                            obscureText: false,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            decoration: InputDecoration(
                              icon: Image.asset(
                                'assets/backgrounds/icons/ic_lmax.png',
                                scale: 2.5,
                              ),
                              labelText: 'Length at Max',
                              labelStyle: TextStyle(fontFamily: 'Raleway'),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kMainAccent, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor)),
                            )),
                        SizedBox(height: 10),
                        TextFormField(
                            controller: lminController,
                            validator: (String value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            obscureText: false,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            decoration: InputDecoration(
                              icon: Image.asset(
                                'assets/backgrounds/icons/ic_lmin.png',
                                scale: 2.5,
                              ),
                              labelText: 'Length at Min',
                              labelStyle: TextStyle(fontFamily: 'Raleway'),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kMainAccent, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor)),
                            )),
                        if (index == 0 || index == 1 || index == 3)
                          SizedBox(height: 10),
                        if (index == 0 || index == 1 || index == 3)
                          TextFormField(
                              controller: hrefCOntroller,
                              obscureText: false,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                                signed: false,
                              ),
                              decoration: InputDecoration(
                                icon: Image.asset(
                                  'assets/backgrounds/icons/ic_href.png',
                                  scale: 2.5,
                                ),
                                labelText: index == 1
                                    ? 'Tx to Upper tap distance'
                                    : 'Tap to Tap distance',
                                labelStyle: TextStyle(fontFamily: 'Raleway'),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kMainAccent, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor)),
                              )),
                        if (index == 6 ||
                            index == 5 ||
                            index == 4 ||
                            index == 1 ||
                            index == 2)
                          SizedBox(height: 10),
                        if (index == 6 ||
                            index == 5 ||
                            index == 4 ||
                            index == 1 ||
                            index == 2)
                          TextFormField(
                              controller: dtxController,
                              obscureText: false,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                                signed: false,
                              ),
                              decoration: InputDecoration(
                                icon: Image.asset(
                                  'assets/backgrounds/icons/ic_distancetx.png',
                                  scale: 2.5,
                                ),
                                labelText: 'Distance Tx-Tap',
                                labelStyle: TextStyle(fontFamily: 'Raleway'),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kMainAccent, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor)),
                              )),
                        if (index == 3) SizedBox(height: 10),
                        if (index == 3)
                          TextFormField(
                              controller: overflowController,
                              obscureText: false,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                                signed: false,
                              ),
                              decoration: InputDecoration(
                                icon: Image.asset(
                                  'assets/backgrounds/icons/ic_ofheight.png',
                                  scale: 2.5,
                                ),
                                labelText: 'Overflow height from below tap',
                                labelStyle: TextStyle(fontFamily: 'Raleway'),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kMainAccent, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor)),
                              )),
                        SizedBox(height: 10),
                        TextFormField(
                            controller: sgpController,
                            obscureText: false,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            decoration: InputDecoration(
                              icon: Image.asset(
                                index == 3
                                    ? 'assets/backgrounds/icons/ic_sg1.png'
                                    : 'assets/backgrounds/icons/ic_sgprocess.png',
                                scale: 2.5,
                              ),
                              labelText: index == 3
                                  ? 'SG of the Upper Process'
                                  : 'SG of the Process',
                              labelStyle: TextStyle(fontFamily: 'Raleway'),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kMainAccent, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor)),
                            )),
                        if (index == 3) SizedBox(height: 10),
                        if (index == 3)
                          TextFormField(
                              controller: sg2Controller,
                              obscureText: false,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                                signed: false,
                              ),
                              decoration: InputDecoration(
                                icon: Image.asset(
                                  'assets/backgrounds/icons/ic_sg2.png',
                                  scale: 2.5,
                                ),
                                labelText: 'SG of the lower process',
                                labelStyle: TextStyle(fontFamily: 'Raleway'),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kMainAccent, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor)),
                              )),
                        if (index == 0 ||
                            index == 1 ||
                            index == 3 ||
                            index == 5 ||
                            index == 6)
                          SizedBox(height: 10),
                        if (index == 0 ||
                            index == 1 ||
                            index == 3 ||
                            index == 5 ||
                            index == 6)
                          TextFormField(
                              controller: sgfController,
                              obscureText: false,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                                signed: false,
                              ),
                              decoration: InputDecoration(
                                icon: Image.asset(
                                  'assets/backgrounds/icons/ic_sgfill.png',
                                  scale: 2.5,
                                ),
                                labelText: 'SG of the fill fluid',
                                labelStyle: TextStyle(fontFamily: 'Raleway'),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kMainAccent, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kMainColor)),
                              )),
                        DropdownButton<String>(
                          value: pressureUnit,
                          onChanged: (String newValue) {
                            //TODO Set the unit to new one
                          },
                          items: unitsItem.map((itemValue) {
                            return DropdownMenuItem(
                              child: Text(itemValue),
                              value: itemValue,
                            );
                          }).toList(),
                        ),
                        TextFormWithDropdown(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
