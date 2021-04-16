import 'package:carousel_slider/carousel_slider.dart';
import 'package:dplevelcalculator/models/pressure_model.dart';
import 'package:dplevelcalculator/screens/detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int _currentPage = 1;

class HomeScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: ListView(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Pressure',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway'),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Column(
                  children: <Widget>[
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.8,
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentPage = index;
                            print(index);
                          });
                        },
                      ),
                      items: pressures
                          .map((item) => Container(
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    child: Hero(
                                      tag: item.name,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PressureDetailScreen(
                                                        pressure: item,
                                                        index: _currentPage,
                                                      )));
                                        },
                                        child: Image(
                                          alignment: Alignment.center,
                                          image: AssetImage(item.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _detailBuilder(_currentPage),
            ])));
  }
}

Widget _detailBuilder(index) {
  return Column(
    children: <Widget>[
      Text(pressures[index].name,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Raleway')),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25.0),
        child: Text(pressures[index].description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18, fontFamily: 'Raleway')),
      ),
    ],
  );
}
